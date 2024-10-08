import { Suspense } from 'react';
import getPersonWithImage from '@/lib/getPersonWithImage';
import IPerson from '@/interfaces/IPerson';
import Loading from '../_components/loading';
import Link from 'next/link';
import { notFound } from 'next/navigation';
import Image from 'next/image';

export default async function PersonId({ params }: { params: { personTag: string } }) {
    const person = await getPersonWithImage(params.personTag);  // Faz a requisição ao banco de dados no lado do servidor

    return (
        <Suspense fallback={<Loading/>}>
            <PersonDetails person={person} />
        </Suspense>
    );
}

// Componente que renderiza os detalhes da pessoa
function PersonDetails({ person }: { person: IPerson | null }) {

    if (!person) {
        return notFound();
    }

    return (
        <>
            <section className='animate-fadeIn flex flex-col items-center justify-center border-gray-100 border-2 w-fit mx-auto h-fit p-4 rounded-xl mt-16'>
                <Image className='w-96 rounded-full h-96 object-cover bg-center' src={`data:image/png;base64,${person.thumb}`} alt={`Imagem de ${person.name}`} />
                <h2 className='text-4xl p-4 my-2'>Oiee&nbsp; 
                    <span className="italic">{person.name}</span>
                </h2>
                <Link href={`/${person.tag}/target`} className='hover:scale-105 transition-transform font-serif italic font-bold text-2xl text-gray-50 px-24 py-2 rounded-2xl bg-gradient-to-tr from-indigo-800 to-pink-500'>Vamo lá!!!</Link>
            </section>
        </>
    );
}
