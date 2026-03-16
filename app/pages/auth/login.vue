<script setup lang="ts">
const supabase = useSupabaseClient();

const loginWithGoogle = async () => {
  const redirectTo = `${window.location.origin}/confirm`;

  const { error } = await supabase.auth.signInWithOAuth({
    provider: "google",
    options: { redirectTo },
  });

  if (error) console.error(error);
};
</script>

<template>
  <div>
    <UButton @click="loginWithGoogle"> Google로 로그인 </UButton>
  </div>
</template>
