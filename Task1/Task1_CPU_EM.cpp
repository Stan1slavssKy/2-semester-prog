#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

struct registers
{
    int eax;
    int ebx;
    int ecx;
    int edx;
};

void cmd_analize (char* word, char* number1, char* number2, struct registers* regis);
void reg_printf (struct registers* regis);

int main ()
{
    struct registers regis = {};

    char sym = 0;
    char* temp    = (char*) calloc (20, sizeof (char));
    char* word    = (char*) calloc (20, sizeof (char));
    char* number1 = (char*) calloc (20, sizeof (char));
    char* number2 = (char*) calloc (20, sizeof (char));

    printf ("Hello Im CPU emmulator\n");
    printf ("Sorry for many cpypast(\n");
    printf ("If u want to leave write end 0 0\n");
    printf ("U may write ur command for example 'mov eax ebx'\n");
    printf ("Write your commands:\n");

    while (strcmp(word, "end"))
    {
        scanf ("%s %[a-zA-Z], %s", word, number1, number2);
        cmd_analize (word, number1, number2, &regis);
    }

    free (word);
    free (temp);
    free (number1);
    free (number2);

    return 0;
}

void cmd_analize (char* word, char* number1, char* number2, struct registers* regis)
{
    if (!strcmp (word, "mov"))
    {
            if (!strcmp (number1, "eax"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> eax = atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "ebx"))
                    {
                        regis -> eax = regis -> ebx;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "ecx"))
                    {
                        regis -> eax = regis -> ecx;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "edx"))
                    {
                        regis -> eax = regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "ebx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> ebx = atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> ebx = regis -> eax;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "ecx"))
                    {
                        regis -> ebx = regis -> ecx;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "edx"))
                    {
                        regis -> ebx = regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "ecx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> ecx = atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> ecx = regis -> eax;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "ebx"))
                    {
                        regis -> ecx = regis -> ebx;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "edx"))
                    {
                        regis -> ecx = regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "edx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> edx = atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> edx = regis -> eax;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "ecx"))
                    {
                        regis -> edx = regis -> ecx;
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "ebx"))
                    {
                        regis -> edx = regis -> ebx;
                        reg_printf (regis);
                    }
            }
    }


    else if (!strcmp (word, "add"))
    {
            if (!strcmp (number1, "eax"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> eax += atoi (number2);
                        reg_printf (regis);
                    }

                    if (!strcmp (number2, "ebx"))
                    {
                        regis -> eax += regis -> ebx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ecx"))
                    {
                        regis -> eax += regis -> ecx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "edx"))
                    {
                        regis -> eax += regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "ebx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> ebx += atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> ebx += regis -> eax;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ecx"))
                    {
                        regis -> ebx += regis -> ecx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "edx"))
                    {
                        regis -> ebx += regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "ecx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> ecx += atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> ecx += regis -> eax;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ebx"))
                    {
                        regis -> ecx += regis -> ebx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "edx"))
                    {
                        regis -> ecx += regis -> edx;
                        reg_printf (regis);
                    }
            }
            else if (!strcmp (number1, "edx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> edx += atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> edx += regis -> eax;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ecx"))
                    {
                        regis -> edx += regis -> ecx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ebx"))
                    {
                        regis -> edx += regis -> ebx;
                        reg_printf (regis);
                    }
            }

    }
    else if (!strcmp (word, "sub"))
    {
            if (!strcmp (number1, "eax"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> eax -= atoi (number2);
                        reg_printf (regis);
                    }

                    if (!strcmp (number2, "ebx"))
                    {
                        regis -> eax -= regis -> ebx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ecx"))
                    {
                        regis -> eax -= regis -> ecx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "edx"))
                    {
                        regis -> eax -= regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "ebx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> ebx -= atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> ebx -= regis -> eax;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ecx"))
                    {
                        regis -> ebx -= regis -> ecx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "edx"))
                    {
                        regis -> ebx -= regis -> edx;
                        reg_printf (regis);
                    }
            }

            else if (!strcmp (number1, "ecx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> ecx -= atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> ecx -= regis -> eax;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ebx"))
                    {
                        regis -> ecx -= regis -> ebx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "edx"))
                    {
                        regis -> ecx -= regis -> edx;
                        reg_printf (regis);
                    }
            }
            else if (!strcmp (number1, "edx"))
            {
                    if (!isalpha(number2[1]))
                    {
                        regis -> edx -= atoi (number2);
                        reg_printf (regis);
                    }
                    if (!strcmp (number2, "eax"))
                    {
                        regis -> edx -= regis -> eax;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ecx"))
                    {
                        regis -> edx -= regis -> ecx;
                        reg_printf (regis);
                    }
                    else if (!strcmp (number2, "ebx"))
                    {
                        regis -> edx -= regis -> ebx;
                        reg_printf (regis);
                    }
            }
    }

}

void reg_printf (struct registers* regis)
{
     printf ("%d %d %d %d\n", regis -> eax, regis -> ebx, regis -> ecx, regis -> edx);
}
