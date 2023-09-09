<script setup>
import Checkbox from '@/Components/Checkbox.vue';
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
    showPassword:false
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <GuestLayout>

        <Head title="Masuk" />
        <v-card min-width="300" max-width="350" class="mx-auto">
            <v-card-text>
                <v-text-field prepend-icon="mdi-email" density='compact' label='Email' v-model='form.email' required
                    variant="outlined" :error-messages="form.errors.email"/>
                <v-text-field prepend-icon="mdi-lock" :append-inner-icon="form.showPassword?'mdi-eye-off':'mdi-eye'" density='compact' label='password'
                    v-model='form.password' required variant="outlined" :type="form.showPassword?'text':'password'" 
                    @click:append-inner="form.showPassword=!form.showPassword"
                    :error-messages="form.errors.password"/>
                <v-sheet class="ml-10">
                    <v-checkbox hide-details density="compact" label="Ingat saya" v-model="form.remember" />
                </v-sheet>
            </v-card-text>
            <v-card-actions>
                <v-btn variant="text" @click="router.get('/register')">Daftar</v-btn>
                <v-spacer/>
                <v-btn @click="form.post('/login')" color="success" variant="flat"
                :disabled="form.processing" :loading="form.processing"
                >Masuk</v-btn>
            </v-card-actions>
        </v-card>
    </GuestLayout>
</template>
