pragma solidity ^0.5.0;

contract IRemoteContract {
	function remoteMethod(uint16 x) public;
}

contract IRemoteContractCallback {
	function remoteMethodCallback(uint16 x) public;
}

contract MyContract is IRemoteContractCallback {

	function tvm_accept() private pure {}
	
	modifier alwaysAccept {
		tvm_accept(); _;
	}

	uint m_result;

	// This function gets an address of the contract and some value 'x',
	// casts the address to IRemoteContract interface and calls
	// method 'remoteMethod' with parameter 'x'.
	function method(address anotherContract, uint16 x) public alwaysAccept {
		IRemoteContract(anotherContract).remoteMethod(x);
		return;
	}
	
	// Implementation of interface IRemoteContractCallback.
	// A function to be called from RemoteContract.
	function remoteMethodCallback(uint16 x) public alwaysAccept {
		// save parameter x in state variable 'm_result'
		m_result = x;
		return;
	}
}
