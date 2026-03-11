<template>
  <nav
    class="flex items-center justify-between px-8 py-4 bg-neutral-900 border-b border-amber-500/30"
  >
    <div class="flex items-center gap-2">
      <NuxtLink to="/" class="text-2xl hover:scale-110 transition-transform">
        🎩
      </NuxtLink>
    </div>

    <div class="flex items-center gap-6">
      <ul class="flex items-center gap-4 text-sm font-medium text-neutral-300">
        <li>
          <NuxtLink
            to="/board"
            class="hover:text-amber-500 transition-colors"
            active-class="text-amber-500"
            >Stage</NuxtLink
          >
        </li>
        <li>
          <NuxtLink
            to="/memo"
            class="hover:text-amber-500 transition-colors"
            active-class="text-amber-500"
            >Grimoire</NuxtLink
          >
        </li>
      </ul>

      <div class="flex items-center gap-2 border-l border-neutral-700 pl-6">
        <UButton
          to="/auth/login"
          variant="ghost"
          color="neutral"
          label="Login"
        />
        <UButton
          to="/auth/register"
          color="neutral"
          variant="solid"
          label="Register"
          class="font-bold"
        />
      </div>
    </div>
  </nav>
</template>
