// Copyright (c) 2009-2017 The Feritcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FERITCOIN_CORE_IO_H
#define FERITCOIN_CORE_IO_H

#include <amount.h>

#include <string>
#include <vector>

class CBlock;
class CScript;
class CTransaction;
struct CMutableTransaction;
class uint256;
class UniValue;

// core_read.cpp
CScript ParseScript(const std::string& s);
std::string ScriptToAsmStr(const CScript& script, const bool fAttemptSighashDecode = false);
bool DecodeHexTx(CMutableTransaction& tx, const std::string& hex_tx, bool try_no_witness = false, bool try_witness = true);
bool DecodeHexBlk(CBlock&, const std::string& strHexBlk);
uint256 ParseHashUV(const UniValue& v, const std::string& strName);
uint256 ParseHashStr(const std::string&, const std::string& strName);
std::vector<unsigned char> ParseHexUV(const UniValue& v, const std::string& strName);

// core_write.cpp
UniValue ValueFromAmount(const CAmount& amount);
std::string FormatScript(const CScript& script);
std::string EncodeHexTx(const CTransaction& tx, const int serializeFlags = 0);
void ScriptPubKeyToUniv(const CScript& scriptPubKey, UniValue& out, bool fIncludeHex);
void TxToUniv(const CTransaction& tx, const uint256& hashBlock, UniValue& entry, bool include_hex = true, int serialize_flags = 0);

#endif // FERITCOIN_CORE_IO_H
