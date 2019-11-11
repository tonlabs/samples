# Hello, world!

This contract adds 2 and 2 and returns the sum as an external message.

## Methods

### Method `compute`
#### Input values
None
#### Output value
* ABI type: `uint64`
* C type: `unsinged`
* Value description: 4 (sum of 2 and 2)
#### Notes
To call this method, send a message to the contract.
All messages are built by `tvm_linker`.
To build a message, invoke the following command:

    tvm_linker message <account> -w 0 --abi_file hello_world.abi
        --abi_method compute --abi_params "{}"

The parameters of the command have the following meaning:

`<account>` stands for the contract account number. Thos 256-bit number in hex format,
file `<account>.tvc` with the compiled contract generated by the compiler at deploy; it has to be stored in the current directory.

* `-w` parameter specifies the message workchain number. It should be 0.

* `--abi_file` parameter should point to ABI interface of the contract. If you are
working in the `hello_world_build.c` subdirectory , it should point to the parent catalog:
`--abi_file ../hello_world.abi`.

* `--abi_method` is used to specify the name of the method to be called. In this example
it is `compute`.

* `--abi_params` is used to specify parameters for the method. Since the `compute` method has no
parameters, empty curve braces are specified here. The braces should be
quoted to be properly understood by shell.

After the command is called, an `xxx_msg_body.boc` file is created with the compiled
message. This file is to be sent to the node.

## Persistent data

None