<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';

const form = useForm({
    id: null,
    name: '',
    email: '',
    phone: '',
    password: '',
    password_confirmation: '',
});

const submit = () => {
   if(form.id===null){
    form.post('/user', {
        onFinish: () => {
            form.reset('name', 'phone', 'password', 'password_confirmation')
        }
    });
   }else{
    form.patch('/user/'+form.id, {
        onFinish: () => {
            form.reset('name', 'phone', 'password', 'password_confirmation')
        }
    });
   }
};

const props = defineProps(['user']);
if (props.user !== undefined) {
    const user = props.user
    form.id = user.id
    form.name = user.name
    form.email = user.email
    form.phone = user.phone
}
</script>

<template>
    <AuthenticatedLayout>

        <Head title="Register"/>

        <v-card min-width="300" max-width="350" class="mx-auto">
            <v-card-text>
                <v-text-field prepend-icon="mdi-account" density='compact' label='Nama Lengkap' v-model='form.name' required
                    variant="outlined" :error-messages="form.errors.name" />
                <v-text-field prepend-icon="mdi-email" density='compact' label='Email' v-model='form.email' required
                    variant="outlined" :error-messages="form.errors.email" />
                <v-text-field prepend-icon="mdi-phone" density='compact' label='Telpon' v-model='form.phone' required
                    variant="outlined" :error-messages="form.errors.phone" />
                    <p v-if="form.id!==null" class="my-2 text-center text-red">Kosongi sandi jika tidak ingin mengubahnya</p>
                <v-text-field prepend-icon="mdi-lock" :append-inner-icon="form.showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                    density='compact' label='Sandi' v-model='form.password' required variant="outlined"
                    :type="form.showPassword ? 'text' : 'password'"
                    @click:append-inner="form.showPassword = !form.showPassword" :error-messages="form.errors.password" />
                <v-text-field prepend-icon="mdi-lock" :append-inner-icon="form.showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                    density='compact' label='Konfirmasi Sandi' v-model='form.password_confirmation' required
                    variant="outlined" :type="form.showPassword ? 'text' : 'password'"
                    @click:append-inner="form.showPassword = !form.showPassword"
                    :error-messages="form.errors.password_confirmation" />
            </v-card-text>
            <v-card-actions>
                <v-spacer />
                <v-btn @click="submit" color="success" variant="flat" :disabled="form.processing"
                    :loading="form.processing">{{ form.id===null?'Simpan':'Perbarui' }}</v-btn>
            </v-card-actions>
        </v-card>
    </AuthenticatedLayout>
</template>
