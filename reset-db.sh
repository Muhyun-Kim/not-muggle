#!/bin/bash

echo "🗑️ Cleaning up old migrations..."
rm -rf prisma/migrations

echo "🔄 Resetting database..."
yarn prisma migrate reset --force

echo "🏗️ Creating fresh 'init' migration..."
yarn prisma migrate dev --name init

echo "✅ Database has been reset and 'init' migration created successfully!"