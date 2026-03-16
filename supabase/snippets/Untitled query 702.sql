-- 1. 새로운 유저가 생길 때 Profile 테이블에 데이터를 넣는 함수 생성
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public."Profile" (id, nickname, role)
  VALUES (
    new.id, 
    split_part(new.email, '@', 1), -- 이메일의 @ 앞부분을 닉네임으로 사용
    'BEGINNER'
  );
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. auth.users 테이블에 insert가 발생하면 위 함수를 실행하는 트리거 설정
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();