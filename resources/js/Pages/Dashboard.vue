<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import List from './Users/List.vue';
defineProps(['users'])
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <List :users="users"/>
    </AuthenticatedLayout>
</template>
