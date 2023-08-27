
<template>
    <div class="w-full max-w-xs">
        <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            {{ user }}
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
import { useStore } from "vuex";
import BaseInput from './BaseInput.vue';
import { useMutation } from "@vue/apollo-composable"
import SignInMutation from "../graphql/user.mutation.gql"


const { mutate: signInUser, onDone, result } = useMutation(SignInMutation, () => ({
    variables: {
        email: userEmail.value,
        password: userPassword.value,
    }
}))

const store = useStore();

const userEmail = ref("")
const userPassword = ref("")

const user = store.state.user

function onSubmit() {
    signInUser();
    console.log(userEmail.value)
    console.log(userPassword.value)
}

onDone(result => {
    store.commit("setUserId", result.data.signInUser.user.id)
})



</script>
<style></style>

