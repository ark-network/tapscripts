// sweep-closure
// constructorInputs:
asp_pubkey:
  type: schnorr public key
lifetime:
    type: BIP68 sequence

// witness 
<asp_signature> 

// script
OP_DATA_X # X depends on len(<lifetime>)
<lifetime>
OP_CHECKSEQUENCEVERIFY
OP_DROP
OP_DATA_32
<asp_pubkey>
OP_CHECKSIG

// miniscript policy: 
and_v(pk(<asp_pubkey>), older(lifetime))
