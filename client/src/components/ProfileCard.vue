<template>
    <div class="bg-white">
        <div class="mx-auto mt-10 max-w-2xl grid border-t border-gray-200 shadow-md p-4">
            <article class="flex flex-col items-center justify-between">
                <div class="relative mt-8 flex items-center gap-x-4">
                    <img src="https://images.unsplash.com/photo-1519244703995-f4e0f30006d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                        alt="" class="h-10 w-10 rounded-full bg-gray-50">
                    <div class="text-sm leading-6">
                        <h3 class="mt-3 text-lg font-semibold leading-6 text-gray-900 group-hover:text-gray-600">
                            <strong>{{ firstName }} {{ lastName }}</strong>
                        </h3>
                        <p class="text-gray-600">{{ locationCity }}, {{ locationState }} | {{ locationCountry }}</p>
                    </div>
                </div>
                <div class="group relative">
                    <p class="mt-5 line-clamp-3 text-sm leading-6 text-gray-600">"{{ bio }}""</p>
                </div>

            </article>

            <!-- More posts... -->
        </div>

    </div>
</template>
<script setup>

const props = defineProps({
    id: {
        type: Number
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

console.log(props.locationCity)

</script>
<style></style>