export default defineNuxtConfig({
  // '@nuxt/supabase' -> '@nuxtjs/supabase'로 수정
  modules: ["@nuxt/ui", "@nuxtjs/supabase"],
  css: ["@/assets/css/main.css"],
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  supabase: {
    redirect: false,
  },
});
