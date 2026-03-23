# Nuxt Minimal Starter

Look at the [Nuxt documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

## Setup

Make sure to install dependencies:

```bash
# npm
npm install

# pnpm
pnpm install

# yarn
yarn install

# bun
bun install
```

## Development Server

Start the development server on `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm dev

# yarn
yarn dev

# bun
bun run dev
```

## Production

Build the application for production:

```bash
# npm
npm run build

# pnpm
pnpm build

# yarn
yarn build

# bun
bun run build
```

Locally preview production build:

```bash
# npm
npm run preview

# pnpm
pnpm preview

# yarn
yarn preview

# bun
bun run preview
```

Check out the [deployment documentation](https://nuxt.com/docs/getting-started/deployment) for more information.

## Prisma 스키마 변경 시

`prisma/schema.prisma` 수정 후 아래 순서대로 실행:

```bash
npx prisma migrate dev --name <migration-name>
yarn gen:types
```

ALTER TABLE "Board" <TableName> ROW LEVEL SECURITY;

## 🛠️ Database Infrastructure (Supabase)

```bash
# start
supabase start

#stop
supabase stop --no-backup

#reset db
./reset-db.sh
```

이 프로젝트는 유저 인증과 프로필 데이터의 무결성을 위해 PostgreSQL 트리거를 사용합니다. `auth.users`에 새로운 유저가 생성되면 자동으로 `public.Profile` 테이블에 기본 정보가 생성됩니다.

### 1. User Profile Automation Trigger

회원가입 시 유저 이메일의 아이디 부분을 닉네임으로 추출하여 프로필을 자동 생성합니다.

```sql
-- 1. 프로필 생성 함수
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public."Profile" (id, nickname, role)
  VALUES (
    new.id,
    split_part(new.email, '@', 1),
    'BEGINNER'
  );
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. 트리거 설정
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
```
