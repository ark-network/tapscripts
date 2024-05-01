// unroll-2-children-closure
// constructorInputs:
taproot_key:
    type: schnorr public key
min_relay_fee_amount:
    type: little-endian uint64

// witness (empty)

// script:
OP_0
OP_INSPECTOUTPUTSCRIPTPUBKEY
OP_1
OP_EQUALVERIFY
OP_DATA_32
<taproot_key>
OP_EQUALVERIFY
OP_0    
OP_INSPECTOUTPUTVALUE               // stack: [out_value_version, out_value]
OP_1
OP_EQUALVERIFY                      // stack: [out_value]
OP_PUSHCURRENTINPUTINDEX
OP_INSPECTINPUTVALUE                // stack: [input_value_version, input_value, out_value]
OP_1
OP_EQUALVERIFY                      // stack: [input_value, out_value]
OP_DATA_8
<min_relay_fee_amount>              // stack: [min_relay_fee_amount, input_value, out_value]
OP_SUB64                            // stack: [input_value - min_relay_fee_amount, out_value]
OP_EQUAL

// miniscript policy
and_v(
    spk_eq(out_spk(0), "5120" + <taproot_key>)),
    value_eq(
        value(sub(curr_inp_value, <min_relay_fee_amount>)),
        out_value(0)
    )
)
