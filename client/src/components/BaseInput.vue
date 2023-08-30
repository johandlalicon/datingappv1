<template>
    <div>
        <label for="">{{ label }}
            <input :value="modelValue" @input="$emit('update:modelValue', $event.target.value)" :placeholder="label"
                v-bind="$attrs" :type="type"
                class="w-96 rounded-md border p-2 text-gray-900  placeholder:text-gray-400 focus:ring-2 focus:ring-inset sm:text-sm sm:leading-6 text-center" />
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