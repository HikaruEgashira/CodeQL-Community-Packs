/**
 * @name Use of Cryptographically Weak Pseudo-Random Number Generator
 * @description Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG).
 * @kind problem
 * @id hikae/weak-cryptographic-prng
 * @problem.severity warning
 * @security-severity 6.0
 * @sub-severity medium
 * @precision low
 * @tags security
 *       external/cwe/cwe-338
 */

import python
import ghsl.cryptography.RandomNumberGenerator

from RandomNumberGenerator::Sinks rngs
select rngs, "Using weak PRNG"
