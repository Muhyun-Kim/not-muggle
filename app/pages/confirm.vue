<script setup lang="ts">
const supabase = useSupabaseClient();
const route = useRoute();

const code = route.query.code as string | undefined;

if (code) {
  const { error } = await supabase.auth.exchangeCodeForSession(code);

  if (error) {
    console.error("Auth error:", error);
    await navigateTo("/auth/login");
  } else {
    await navigateTo("/");
  }
} else {
  await navigateTo("/auth/login");
}
</script>

<template>
  <div>로그인 처리 중...</div>
</template>
