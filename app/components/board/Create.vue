<script setup lang="ts">
import type { FormSubmitEvent } from "@nuxt/ui";

const props = defineProps<{
  genre: "CARD" | "COIN";
  pageTitle: string;
}>();

const client = useSupabaseClient();
const user = useSupabaseUser();

const state = reactive({
  title: "",
  content: "",
});

const onSubmit = async (e: FormSubmitEvent<typeof state>) => {
  if (!user.value?.sub) {
    return;
  }
  const { error } = await client.from("Board").insert({
    title: e.data.title,
    content: e.data.content,
    genre: props.genre,
    authorId: user.value.sub,
  });
  if (error) return console.error(error);
  navigateTo(`/board/${props.genre.toLowerCase()}`);
};
</script>

<template>
  <div class="w-full h-full flex flex-col gap-4 items-center justify-center">
    <h1>{{ pageTitle }}</h1>
    <UForm :state="state" @submit="onSubmit">
      <UFormField label="제목" name="title">
        <UInput v-model="state.title" placeholder="제목을 입력해주세요." />
      </UFormField>
      <UFormField label="내용" name="content">
        <UInput v-model="state.content" placeholder="내용을 입력해주세요." />
      </UFormField>
      <UButton type="submit" label="저장" />
    </UForm>
  </div>
</template>
