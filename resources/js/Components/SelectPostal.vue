<template>
    <v-text-field :error-messages="error" @click:control="showModal" item-title="village" item-value="code"
        density="compact" :label="label" v-model="value" clearable append-inner-icon="mdi-menu-down" />
    <v-dialog max-width="500" v-model="promp">
        <v-card title="Pilih Kelurahan">
            <v-card-text>
                <v-row>
                    <v-col cols="12" md="6">
                        <v-text-field ref="sform" @keydown.enter="getKodepos" v-model="search" density="compact"
                            placeholder="kelurahan..." clearable @click:clear="resetSearch" />
                    </v-col>
                    <v-col cols="12" md="6">
                        <v-text-field @click:append="getKodepos" @keydown.enter="getKodepos" v-model="district"
                            density="compact" placeholder="kecamatan..." append-icon="mdi-magnify" clearable
                            @click:clear="resetSearch" />
                    </v-col>
                </v-row>
                <v-list>
                    <template v-for="adm of kodepos">
                        <v-list-item @click="$emit('update:modelValue', adm); promp = false">
                            <template #title>
                                {{ adm.village }} ({{ adm.postal }})
                            </template>
                            <template #subtitle>
                                {{ adm.district }} | {{ adm.city }} | {{ adm.province }}
                            </template>
                            <v-divider />
                        </v-list-item>
                    </template>
                </v-list>
            </v-card-text>
        </v-card>
    </v-dialog>
</template>

<script setup>
import { computed, ref } from "vue";
import Pagination from "@/components/Pagination.vue";

const props = defineProps(['modelValue', 'label', 'error'])
const emit = defineEmits(['update:modelValue'])
const promp = ref(false)
const search = ref('')
const district = ref('')
const kodepos = ref([])
const sform = ref()
const showModal = () => {
    promp.value = true
    setTimeout(() => {
        sform.value.focus()
    }, 500)
}
const value = computed({
    get() {
        return props.modelValue?.village
    },
    set(value) {
        emit('update:modelValue', value)
    }
})
const getKodepos = () => {
    const term = search.value === '' || search.value === null ? '' : '?search=' + search.value
    const conj = search.value === '' || search.value === null ? '?' : '&'
    const dist = district.value === '' || district.value === null ? '' : conj + 'district=' + district.value
    axios.get('/kodepos' + term + dist).then(res => {
        kodepos.value = res.data.data
    })
}
const resetSearch = () => {
    search.value = ''
    getKodepos()
}
getKodepos()
</script>