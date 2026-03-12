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
      <UButton
        to="/auth/login"
        variant="ghost"
        color="neutral"
        label="로그인"
      />
      <UButton
        to="/auth/register"
        color="neutral"
        variant="solid"
        label="회원가입"
      />
    </div>
  </nav>
</template>
