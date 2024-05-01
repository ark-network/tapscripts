// sweep-closure
// constructorInputs
owner_pubkey:
  type: schnorr public key
redeem_delay:
  type: BIP68 sequence

// witness 
<owner_signature>

// script
OP_DATA_X # X depends on len(<lifetime>)
<redeem_delay>
OP_CHECKSEQUENCEVERIFY
OP_DROP
OP_DATA_32
<owner_pubkey>
OP_CHECKSIG

// miniscript policy
and_v(pk(<asp_pubkey>), older(lifetime))
