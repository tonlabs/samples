pragma ever-solidity >= 0.72.0;
pragma AbiHeader expire;

contract WidthProvider {
    function getWidth(uint64 id) pure external responsible returns(uint64, uint32) {
        return{value: 0, bounce: false, flag: 64}(id, 43);
    }
}
