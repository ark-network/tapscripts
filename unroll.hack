// unroll-closure
// constructorInputs:
left_taproot_key:
    type: schnorr public key
left_amount:
    type: little-endian uint64
right_taproot_key:
    type: schnorr public key
right_amount:
      type: little-endian uint64

// witness (empty)

// script:
OP_0
OP_INSPECTOUTPUTSCRIPTPUBKEY
OP_1
OP_EQUALVERIFY
OP_DATA_32
<left_taproot_key>
OP_EQUALVERIFY
OP_0
OP_INSPECTOUTPUTVALUE
OP_1
OP_EQUALVERIFY
OP_DATA_8
<left_amount>
OP_EQUALVERIFY
OP_1
OP_INSPECTOUTPUTSCRIPTPUBKEY
OP_1
OP_EQUALVERIFY
OP_DATA_32
<right_taproot_key>
OP_EQUALVERIFY
OP_1
OP_INSPECTOUTPUTVALUE
OP_1
OP_EQUALVERIFY
OP_DATA_8
<right_amount>
OP_EQUAL

// miniscript policy
and_v(
    and_v(
        spk_eq(out_spk(0), "5120" + <left_taproot_key>),
        value_eq(out_value(0), <left_amount>)
    ),
    and_v(
        spk_eq(out_spk(1), "5120" + <right_taproot_key>),
        value_eq(out_value(1), <right_amount>)
    )
)
