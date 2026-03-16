#!/bin/bash

# 1. 기존 이력 삭제
rm -rf prisma/migrations

# 2. DB 초기화 (데이터 삭제)
yarn prisma migrate reset --force

# 3. 깨끗한 스키마 기반으로 'init' 생성
# 이 단계가 끝나면 자동으로 prisma/seed.ts 가 실행되도록 설정되어 있어야 합니다.
yarn prisma migrate dev --name init

echo "✅ DB Reset + Init Migration + Auth Trigger (via Seed) 완료!"