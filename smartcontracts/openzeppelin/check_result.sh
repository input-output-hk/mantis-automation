#!/bin/bash
export SKIPPED=$(cat mochawesome-report/mochawesome.json| egrep -io 'skipped": [0-9]+' | awk '{print $2}')
echo "Skipped tests count: $SKIPPED"
if [ $SKIPPED -gt 15 ]; then exit 3; fi
export FAILED=$(cat mochawesome-report/mochawesome.json | grep -i "fail.: true" | wc -l)
echo "Failed tests count: $FAILED"
export TIMED_OUT=$(cat mochawesome-report/mochawesome.json | grep -i timeout | grep -i message | grep -i exceeded | wc -l)
echo "Timed out tests count: $TIMED_OUT"
if [ "$TIMED_OUT" -eq "$FAILED" ] ;then exit 0;else exit 1; fi

