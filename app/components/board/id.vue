<script setup lang="ts">
import type { FormSubmitEvent } from "@nuxt/ui";
const props = defineProps<{
  id: number;
}>();
const client = useSupabaseClient();
const user = useSupabaseUser();

const { data: board } = await useAsyncData("board", async () => {
  const { data } = await client.from("Board").select("*").eq("id", props.id);
  return data?.[0] ?? null;
});

const isOwner = computed(() => {
  return board.value?.authorId === user.value?.sub;
});

const handleDelete = async () => {
  const { error } = await client.from("Board").delete().eq("id", props.id);
  if (error) console.error(error);
  navigateTo(`/board/${board.value?.genre.toLowerCase()}`);
};

const onSubmit = async (e: FormSubmitEvent<typeof board.value>) => {
  if (!user.value?.sub) {
    return;
  }
  const { error } = await client
    .from("Board")
    .update({
      title: e.data?.title ?? "",
      content: e.data?.content ?? "",
    })
    .eq("id", props.id);
  if (error) return console.error(error);
  navigateTo(`/board/${board.value?.genre.toLowerCase()}`);
};
</script>

<template>
  <div
    class="w-full h-full flex flex-col gap-4 items-center justify-center"
    v-if="board"
  >
    <h1>{{ board.title }}</h1>
    <UForm :state="board" @submit="onSubmit">
      <UFormField label="제목" name="title">
        <UInput v-model="board.title" placeholder="제목을 입력해주세요." />
      </UFormField>
      <UFormField label="내용" name="content">
        <UInput v-model="board.content" placeholder="내용을 입력해주세요." />
      </UFormField>
      <UButton type="submit" label="저장" />
      <UButton v-if="isOwner" @click="handleDelete" label="삭제" />
    </UForm>
  </div>
</template>
