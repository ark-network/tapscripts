// vtxo-forfeit-closure
// constructorInputs:
asp_pubkey:
  type: schnorr public key
owner_pubkey:
  type: schnorr public key

// witness
<owner_signature>
<asp_signature>

// script:
OP_DATA_32
<asp_pubkey>
OP_CHECKSIGVERIFY
OP_DATA_32
<owner_pubkey>
OP_CHECKSIG

// miniscript policy
multi_a(2, asp_pubkey, owner_pubkey)
