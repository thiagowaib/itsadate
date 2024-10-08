import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function getPersonWithImage(personTag: string) {
    // Busca a pessoa no banco de dados
    const person = await prisma.person.findUnique({
        where: {
            tag: personTag
        }
    });

    const p = person != null ? {
        id: person.id,
        tag: person.tag,
        name: person.name,
        thumb: person?.thumb?.toString() || ""
    } : null;

    return p;
}
