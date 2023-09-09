<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';

const form = useForm({
    name: '',
    email: '',
    phone: '',
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <GuestLayout>

        <Head title="Register" />

        <v-card min-width="300" max-width="350" class="mx-auto">
            <v-card-text>
                <v-text-field prepend-icon="mdi-account" density='compact' label='Nama Lengkap' v-model='form.name' required
                    variant="outlined" :error-messages="form.errors.name" />
                <v-text-field prepend-icon="mdi-email" density='compact' label='Email' v-model='form.email' required
                    variant="outlined" :error-messages="form.errors.email" />
                <v-text-field prepend-icon="mdi-phone" density='compact' label='Telpon' v-model='form.phone' required
                    variant="outlined" :error-messages="form.errors.phone" />
                <v-text-field prepend-icon="mdi-lock" :append-inner-icon="form.showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                    density='compact' label='Sandi' v-model='form.password' required variant="outlined"
                    :type="form.showPassword ? 'text' : 'password'" @click:append-inner="form.showPassword = !form.showPassword"
                    :error-messages="form.errors.password" />
                <v-text-field prepend-icon="mdi-lock" :append-inner-icon="form.showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                    density='compact' label='Konfirmasi Sandi' v-model='form.password_confirmation' required variant="outlined"
                    :type="form.showPassword ? 'text' : 'password'" @click:append-inner="form.showPassword = !form.showPassword"
                    :error-messages="form.errors.password_confirmation" />
            </v-card-text>
            <v-card-actions>
                <v-spacer />
                <v-btn size="small" variant="text" @click="router.get('/login')">Sudah punya akun?</v-btn>
                <v-btn @click="form.post('/register')" color="success" variant="flat" :disabled="form.processing"
                    :loading="form.processing">Daftar</v-btn>
            </v-card-actions>
        </v-card>
    </GuestLayout>
</template>
