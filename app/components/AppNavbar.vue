<script setup lang="ts">
const supabase = useSupabaseClient();
const user = useSupabaseUser();

const handleLogout = async () => {
  await supabase.auth.signOut();
  await navigateTo("/auth/login");
};
</script>

<template>
  <nav
    class="flex items-center justify-between px-8 py-4 bg-neutral-900 border-b border-amber-500/30"
  >
    <div class="flex items-center gap-2">
      <NuxtLink to="/" class="text-2xl hover:scale-110 transition-transform">
        🎩
      </NuxtLink>
    </div>

    <div class="flex items-center gap-2">
      <UButton to="/board" variant="ghost" color="neutral" label="게시판" />
      <UDivider orientation="vertical" class="h-4" />
      <UButton
        v-if="!user"
        to="/auth/login"
        variant="ghost"
        color="neutral"
        label="로그인"
      />
      <UButton
        v-else
        @click="handleLogout"
        variant="ghost"
        color="neutral"
        label="로그아웃"
      />
    </div>
  </nav>
</template>
