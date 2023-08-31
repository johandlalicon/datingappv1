<template>
    <div class="bg-white" :hidden="hidden">
        <div class="mx-auto mt-10 max-w-2xl grid border-t border-gray-200 shadow-md p-4">
            <article class="flex flex-col items-center justify-between">
                <div class="relative mt-8 flex items-center gap-x-4">
                    <img src="https://images.unsplash.com/photo-1519244703995-f4e0f30006d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        alt="" class="h-10 w-10 rounded-full bg-gray-50">
                    <div class="text-sm leading-6">
                        <h3 class="mt-3 text-lg font-semibold leading-6 text-gray-900 group-hover:text-gray-600">
                            <strong>{{ firstName }} {{ lastName }} </strong>
                        </h3>
                        <p class="text-gray-600">{{ locationCity }}, {{ locationState }} | {{ locationCountry }}</p>
                    </div>
                </div>
                <div class="group relative">
                    <p class="mt-5 line-clamp-3 text-sm leading-6 text-gray-600">"{{ bio }}""</p>
                </div>
                <button @click="onLike(userId)"
                    class="py-2 px-4 text-sm bg-sky-500 text-white mt-8"><strong>LIKE</strong></button>
            </article>

        </div>

    </div>
</template>
<script setup>

import { ref } from "vue";
import SendLikeQuery from "../graphql/sendLike.mutation.gql"
import { useMutation } from "@vue/apollo-composable"
import { toast } from 'vue3-toastify';
import MutualUsersQuery from '../graphql/mutualLike.query.gql'
import { useQuery } from "@vue/apollo-composable"
import 'vue3-toastify/dist/index.css';

const likedUser = ref("");
const hidden = ref(false);

const { mutate: sendLike, onDone } = useMutation(SendLikeQuery, () => ({
    variables: {
        userId: likedUser.value,
    }
}))

function onLike(userId) {

    likedUser.value = parseInt(userId)
    console.log(likedUser.value)
    hidden.value = true;
    sendLike()

}

onDone((result) => {
    console.log(result)
    toast("Woohooo", {
        autoClose: 1000,
    });
    sendLike.result.refetchQueries([
        { query: MutualUsersQuery },
    ]);

})

const props = defineProps({
    userId: {
        type: String
    },
    firstName: {
        type: String,
    },
    lastName: {
        type: String,
    },
    locationCity: {
        type: String,
    },
    locationCountry: {
        type: String,
    },
    locationState: {
        type: String,
    },
    bio: {
        type: String,
    },
})

</script>
<style></style>