#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

FERITCOIND=${FERITCOIND:-$SRCDIR/feritcoind}
FERITCOINCLI=${FERITCOINCLI:-$SRCDIR/feritcoin-cli}
FERITCOINTX=${FERITCOINTX:-$SRCDIR/feritcoin-tx}
FERITCOINQT=${FERITCOINQT:-$SRCDIR/qt/feritcoin-qt}

[ ! -x $FERITCOIND ] && echo "$FERITCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($FERITCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for feritcoind if --version-string is not set,
# but has different outcomes for feritcoin-qt and feritcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$FERITCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $FERITCOIND $FERITCOINCLI $FERITCOINTX $FERITCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
