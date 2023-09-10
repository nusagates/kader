<template>
  {{ formatedDate }}
  <span v-if="showTerbilang">
    (
    <terbilang :number="date.getDate()"/>
    {{ date.toLocaleString('id-ID', {month: 'long'}).toLowerCase() }}
    <terbilang :number="date.getFullYear()"/>
    )
  </span>
</template>

<script setup>
import {computed, ref} from "vue";
import Terbilang from "@/Components/Terbilang.vue";

const props = defineProps(
    {
      date:     String,
      showTerbilang: {
        type:    Boolean,
        default: true
      }
    }
)
const date = new Date(props.date)
let formatedDate = computed(() => {
  const regex = /^\d{4}-\d{2}-\d{2}$/;

  if (regex.test(props.date)) {
    formatedDate = `${date.getDate()}-${date.getMonth()+1}-${date.getFullYear()}`
  } else {
    formatedDate = props.date
  }
  return formatedDate
})
</script>