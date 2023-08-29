<template>
    <div>
        <label for="">{{ label }}
            <input :value="modelValue" @input="$emit('update:modelValue', $event.target.value)" :placeholder="label"
                v-bind="$attrs" :type="type"
                class="block w-full rounded-md border-0 py-1.5 pl-7 pr-20 text-gray-900  placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6" />
        </label>
    </div>
</template>

<script setup>
defineProps({
    modelValue: {
        type: [String, Number],
        default: ""
    },
    label: {
        type: String,
        default: ""
    },
    type: {
        type: String,
        default: "text"
    }
})

</script>

<style scoped></style>