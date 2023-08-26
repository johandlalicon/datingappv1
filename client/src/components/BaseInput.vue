<template>
    <div>
        <label for="">{{ label }}
            <input :value="modelValue" @input="$emit('update:modelValue', $event.target.value)" :placeholder="label"
                v-bind="$attrs" :type="type"
                class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6" />
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