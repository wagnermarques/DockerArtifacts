#!/bin/bash

echo "$@"
exec "$@"
dotnet test
