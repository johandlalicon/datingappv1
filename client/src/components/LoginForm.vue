
<template>
    <div class="w-full max-w-xs">
        <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <div class="mb-4">
                <BaseInput v-model="userEmail" placeholder="Email" type="email" />
            </div>
            <div class="mb-6">
                <BaseInput v-model="userPassword" type="password" placeholder="Password" />
            </div>

            <button
                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                type="button" @click="onSubmit">
                Sign In
            </button>

        </form>
    </div>
</template>
<script setup>
import { ref } from 'vue';
import BaseInput from './BaseInput.vue';

const userEmail = ref("")
const userPassword = ref("")

function onSubmit() {
    console.log(userEmail.value)
    console.log(userPassword.value)
}


</script>
<style></style>

