#include <string.h>
#include <time.h>
#include <locale.h>
#include <windows.h>
#include <stdio.h>

int vetorauxiliar[1000],figurinhas_coladas[1000]={0},numero_do_vetor=0,repetidas[1000]={0},numero_de_repetidas=0,auxiliar7=0;

int user_logon;

void menu_cadastro();
void cadastro();
void iniciar_vetor();
void login();
void logon();
void menu_album();
void Mostrar();
void ver_se_possui();
void Compra();
void MostraRepetidas();
void linha(int num, char ch);

///ARQUIVO DO LOGIN
FILE * user;
FILE * senha;
///ARQUIVO REPETIDAS
FILE * user0;
FILE * user1;
FILE * user2;
FILE * user3;
FILE * user4;
FILE * user5;
FILE * user6;
///ARQUIVO COLADAS
FILE * user0_co;
FILE * user1_co;
FILE * user2_co;
FILE * user3_co;
FILE * user4_co;
FILE * user5_co;
FILE * user6_co;
///ARQUIVO CONVITE
FILE * user0_c;
FILE * user1_c;
FILE * user2_c;
FILE * user3_c;
FILE * user4_c;
FILE * user5_c;
FILE * user6_c;


FILE * user0_r;///teste



void ENTER()
{
    char c;
    printf("Aperte ENTER para continuar\n");
    scanf("%c",&c);
    if ( c == '\n' )
    {
       system ("cls");
    }
    else
    {
        printf("Comando inválido.\n");
    }
}

struct dados_cadastro
{
    char user[6];
    char user_teste[5];
    char senha[4];
    char senha_teste[4];
}usuario;


void menu_cadastro()
{
    int option_user;
    printf("    Escolha uma opção:\n");
    printf("                     1-Cadastrar novo usuário\n");
    printf("                     2-Fazer login de usuário\n");
    printf("                     3-Fazer logon de usuário\n");
    printf("                       Já se decidiu? Escreva o número da sua opção:\n");
    scanf("%d",&option_user);
    switch(option_user)
    {
        case 1: system ("cls");
                cadastro();
                break;

        case 2: system ("cls");
                login();
                break;

        case 3: system ("cls");
                logon();
                break;

        default: printf ("Opção selecionada não disponível.\nTente novamente.\n");
                 menu_cadastro();
    }
}


void iniciar_vetor()
{
        strcpy(usuario.user, "NULL");
        strcpy(usuario.senha, "NULL");
}


void cadastro()
{
    int i,compare,numero,linha,user_igual = 0;
    iniciar_vetor();

    user = fopen ("user.txt","a+");

    printf("******CADASTRO******\n");
    printf("Insira um nome de usuário com 5 letras: ");
    scanf("%s",&usuario.user_teste);

     while(fgets(usuario.user, 6, user) != NULL)

        {
            ///tudo que está em uma linha do arquivo vai para a string

            for (linha = 0; linha < 6; linha ++)///até 6 usuários
            {
                numero = 0;///começa em 0 para uma nova linha

                for ( i = 0; i < 5 ; i++ )///uma linha
                {
                    if (usuario.user_teste[i]!= usuario.user[i] )///caractere por caractere
                    {
                        numero++;
                    }
                }


                if (numero == 0)///linha toda igual
                {
                    user_igual++;

                }
            }

        }
        fclose(user);


        if (user_igual == 0)///não tem usuario com esse nome
            {
                user = fopen ("user.txt","a+");

                strcpy(usuario.user,usuario.user_teste);///se o nome for aprovado, ele vai para a string oficial
                fprintf(user,"%s\n",usuario.user);

                fclose(user);

                insira_senha:
                printf("\nInsira uma senha de 4 letras\n");
                fflush(stdin);

                for(i=0;i<4;i++)
                {
                    usuario.senha_teste[i]=getch();
                    putchar('*');
                }

                printf("\n");
                printf("Confirme sua senha\n");
                fflush(stdin);

                for(i=0;i<4;i++)
                {
                    usuario.senha[i]=getch();
                    putchar('*');
                }
                printf("\n");

                compare = strncmp(usuario.senha,usuario.senha,4);///comparando senhas

                if(compare == 0)///se senhas forem compatíveis
                {
                    printf("Senha salva\n");
                    ENTER();
                    senha = fopen ("senha.txt","a+");
                    strcpy(usuario.senha,usuario.senha_teste);///passando senha oficial para string oficial

                    fprintf(senha,"%s\n",usuario.senha);///string oficial vai para arquivo
                    fclose(senha);
                    login();
                }
                else///se senhas não forem compatíveis
                {

                printf("Senhas não são compatíveis\nTente novamente\n");

                ENTER();

                goto insira_senha;

                }
            }
        else
        {
            ENTER();
            printf("O nome de usuário inserido já foi utilizado.\n\nPor favor tente novamente\n");
            ENTER();
            cadastro();

        }
}

void login()
{
    iniciar_vetor();

    user = fopen ("user.txt","a+");

    if (user == NULL)///aviso de erro
    {
        printf("Erro ao abrir arquivo\n");
        exit(0);
    }

    int linha ,numero,i,option_senha_errada;
    int user_igual=0;
    int senha_igual=0;
    int aux = 0,aux1=0;
    user_logon = 0;

    printf("******LOGIN******\n");
    printf("Usuário: ");
    fflush(stdin);
    for(i=0;i<5;i++)
                {
                    usuario.user_teste[i]=getch();
                    printf("%c", usuario.user_teste[i] );
                }
                printf("\n");

    while(fgets(usuario.user, 6, user) != NULL)

    {///tudo que está em uma linha do arquivo vai para a string

        for(linha = 0;linha < 6;linha++)
        {
            numero = 0;///começa em 0 para uma nova linha

            for ( i = 0; i < 5 ; i++ )///uma linha
            {
                if (usuario.user_teste[i]!= usuario.user[i] )///caractere por caractere
                {
                    numero++;
                }
            }

            if (numero == 0)///linha toda igual
            {
                user_igual++;
                aux1 = aux1+linha;
            }
        }
    }
    fclose(user);

    if (user_igual != 0)///se existir usuario com esse nome
    {
        inserir_senha:
        printf("\n\nSenha: ");
        fflush(stdin);

        for(i=0;i<4;i++)///inserindo senha
        {
            usuario.senha_teste[i]=getch();
            putchar('*');
        }
        printf("\n");
        senha = fopen ("senha.txt","a+");

        while(fgets(usuario.senha, 5, senha) != NULL)//procurando senha
        {//tudo que está em uma linha do arquivo vai para a string

            for(linha = 0 ; linha < 6 ;linha++)///até 6 senhas
            {
                numero = 0;///começa em 0 para uma nova linha

                if (aux == linha)///checa a linha do usuario
                {
                    for ( i = 0; i < 4 ; i++ )///uma linha
                    {

                        if (usuario.senha[i]!= usuario.senha_teste[i] )///caractere por caractere
                        {

                            numero++;///se um caractere for diferente, vai adicionando
                        }
                    }

                    if (numero <= 1)///linha toda igual
                    {
                        senha_igual++;///indica que existe uma senha igual
                    }
                }
            }
        }

        fclose(senha);

        if ( senha_igual != 0)///se existe senha igual
        {

            printf("\n\nUsuário logado com sucesso!\n\n");
            user_logon = aux1 - 15;
            ENTER();
        }

        else///essa senha não foi encontrada
        {
            ENTER();
            printf("Senha não corresponde com o usuário inserido\n\n");
            printf("O que deseja fazer?\n");
            printf("                    1 - Logar outro usuário.\n");
            printf("                    2 - Tentar outra senha.\n");
            printf("                    3 - Voltar para o menu inicial.\n");
            printf("                    Escreva o número da sua opção:");
            scanf("%d",&option_senha_errada);
            ENTER();

            switch(option_senha_errada)
            {
                case 1: system ("cls");
                        login();
                        break;

                case 2: system ("cls");
                        goto inserir_senha;
                        break;

                case 3: system ("cls");
                        menu_cadastro();

                default: system ("cls");
                         printf("Opção selecionada não disponível.\nPor favor tente novamente\n");
                         login();
            }
        }
    }

    else ///usuario não encontrado
    {
        ENTER();
        printf("Não existe usuário logado com esse nome\n\n");
        ENTER();
        cadastro();
    }
}



void logon()///fechar arquivo aqui
{
    char resposta;
    printf("Tem certeza que gostaria de sair desse usuário?\n\n");
    printf("Insira S ou N\n\n");
    scanf("%c", &resposta);

    switch (resposta)
    {
        case 'S':

            {
                ENTER();

             switch(user_logon)
            {
                case 1: {fclose(user0);
                        menu_cadastro();
                        break;}

                case 2: {fclose(user1);
                        menu_cadastro();
                        break;}


                case 3: {fclose(user2);
                        menu_cadastro();
                        break;}

                case 4: {fclose(user3);
                        menu_cadastro();
                        break;}

                case 5: {fclose(user4);
                        menu_cadastro();
                        break;}

                case 6: {fclose(user5);
                        menu_cadastro();
                        break;}

                case 7:{fclose(user6);
                       menu_cadastro();
                        break;}
            }}




        case 'N':

            {
              ENTER();
                      printf("Você será redirecionado para o menu de cadastro");
                      menu_cadastro();
                      break;
            }

        default: {
                printf("Opção selecionada não disponível.\nTente novamente.\n");
                ENTER();
                logon();
                ENTER();
                menu_cadastro;

                }

    }
}


 menu_album()
{
    int option,pacotes_comprados,numerodafig,figurinha_buscada,escolha,auxiliar5,auxiliar8;
    printf("MENU:\n\n");
    printf("    Escolha uma opção:\n\n");/*Pensei em colocar strings no lugar de numeros, mas teria que colocar if else, o que acha?*/
    printf("                     1-Verificar o estado atual do álbum\n\n");
    printf("                     2-Ver figurinhas faltantes\n\n");
    printf("                     3-Comprar pacotes de figurinhas\n\n");/*iv*/
    printf("                     4-Buscar figurinha\n\n");/*vi*/
    printf("                     5-Ver  figurinhas repetidas\n\n\n");/*vi | O que acha de criarmos multiplos usuarios ?*/
    printf("    Escreva o número da sua opção: ");
    scanf("%d",&option);

    switch (option)
        {
            case 1 :
                {
                  system ("cls");
                  Mostra_pagina();
                  break;
                }

            case 2 :
                {
                  system ("cls");
                  printf("Essas são as figurinhas faltantes:\n");
                  figurinhas_faltantes();

                  break;
                }

            case 3 :
               {  system ("cls");
                  Compra();
                  break;
               }
            case 4 :
                {
                  system ("cls");
                  printf("Digite o numero da figurinha que você deseja buscar:");
                  scanf("%i",&figurinha_buscada);
                 while (figurinha_buscada==0,figurinha_buscada>680)//Dependera do numero de figurinhas
                 {
                   printf("Essa figurinha não existe, por favor digite o numero da figurinha novamente:");
                   scanf("%i",&figurinha_buscada);
                  }
                  ver_se_possui(figurinha_buscada,figurinhas_coladas,repetidas);
                  Mostrar(figurinha_buscada);
                  printf("\n                                        1-Voltar ao menu\n");
                  scanf("%i",&auxiliar5);
                  switch(auxiliar5)
                  {
                      case 1:
                      {
                          system("cls");
                          menu_album();
                      }
                  }
                  break;
                }
            case 5 :
                {
                  system ("cls");
                  MostraRepetidas(repetidas);

                  break;
                }

            case 6:
                {
                    system("cls");
                    logon();
                    break;





                }
            default: printf ("Opção selecionada não disponível.\n");

        }
}
struct DATA
{
    int dia;
    int mes;
    long int ano;
};

struct ficha_jogador
{
    int num_fig;
    char nome[100];
    char pais[100];
    char time[100];
    int peso;
    float altura;
    char posicao[100];
    struct DATA nasc;
    int raro;
};


//CriandoFigurinhas

 struct ficha_jogador jogadores[]=
    {
     {0,"Luka Modric","Croacia","Real Madrid",70,1.70,"Meia Atacante",{12,07,1985},1},
     {1,"ESCUDO DA FIFA","-----","-----",0,0,"-----",{0,0,0},1},
     {2,"TROFÉU DA COPA","-----","-----",0,0,"-----",{0,0,0},1},
     {3,"Arena Kazan (Kazan)   ","-----","-----",0,0,"-----",{0,0,0},0},
     {4,"Estádio Lujniki (Moscou)","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {5,"Estádio Spartak (Moscou)","-----","-----",0,0,"-----",{0,0,0},0},
     {6,"Estádio São Petesburgo (São Petesburgo) ","-----","-----",0,0,"-----",{0,0,0},0},
     {7,"Estádio Nizhny Novgorod (Nizhny Novgorod)","-----","-----",0,0,"-----",{0,0,0},0},
     {8,"Estádio Olímpico de Sochi (Sochi)       ","-----","-----",0,0,"-----",{0,0,0},0},
     {9,"Arena Samara (Samara)","-----","-----",0,0,"-----",{0,0,0},0},
     {10,"Arena Rostov (Rostov-on-Don)","-----","-----",0,0,"-----",{0,0,0},0},
     {11,"Arena Ecaterimburgo (Ecaterimburgo)","-----","-----",0,0,"-----",{0,0,0},0},
     {12,"Estádio de Saransk (Saransk)","-----","-----",0,0,"-----",{0,0,0},0},
     {13,"Arena Volgogrado (Volgogrado)","-----","-----",0,0,"-----",{0,0,0},0},
     {14,"ESCUDO DA RÚSSIA","Rússia","-----",0,0,"-----",{0,0,0},1},
     {15,"TIME DA RÚSSIA","Rússia","-----",0,0,"-----",{0,0,0},0},
     {16,"Igor Akinfeev","Rússia","CSKA Moscou",82,1.86,"Goleiro",{8,4,1986},0},
     {17,"Mário Fernandes","Rússia","CSKA Moscou",80,1.87,"Defensor",{19,9,1990},0},
     {18,"Ilya Kutepov","Rússia","Spartak Moscou",83,1.92,"Defensor",{29,7,1993},0},
     {19,"Viktor Vasin","Rússia","CSKA Moscou",83,1.92,"Defensor",{8,4,1986},0},
     {20,"Dmitri Kombarov","Rússia","Spartak Moscou",72,1.82,"Defensor",{22,1,1987},0},
     {21,"Aleksandr Golovin","Rússia","CSKA Moscou",69,1.80,"Meio-campista",{30,5,1996},0},
     {22,"Aleksandr Samedov","Rússia","Spartak Moscou",72,1.77,"Meio-campista",{19,7,1984},0},
     {23,"Alan Dzagoev","Rússia","CSKA Moscou",75,1.79,"Meio-campista",{17,6,1990},0},
     {24,"Dmitry Poloz","Rússia","Zenit",73,1.83,"Atacante",{12,7,1991},0},
     {25,"Fedor Smolov","Rússia","Krasnodar",80,1.87,"Atacante",{9,2,1990},0},
     {26,"Aleksandr Kokorin","Rússia","Zenit",74,1.81,"Atacante",{19,3,1991},0},
     {27,"ESCUDO DA ARÁBIA SAUDITA","Arábia Saudita","-----",0,0,"-----",{0,0,0},1},
     {28,"TIME DA ARÁBIA SAUDITA","Arábia Saudita","-----",0,0,"-----",{0,0,0},0},
     {29,"Abdullah Al-Mayouf","Arábia Saudita","AL-Hilal",83,1.88,"Goleiro",{12,07,1985},0},
     {30,"Osama Hawsawi","Arábia Saudita","AL-Hilal",78,1.85,"Defensor",{12,07,1985},0},
     {31,"Abdullah Al-Zori","Arábia Saudita","AL-Hilal",73,1.78,"Defensor",{12,07,1985},0},
     {31,"Mansour Al-Harbi","Arábia Saudita","AL-Ahli",65,1.70,"Defensor",{12,07,1985},0},
     {33,"Omar Hawsawi","Arábia Saudita","AL-Nassr",74,1.84,"Defensor",{12,07,1985},0},
     {34,"Taisir Al-Jassim","Arábia Saudita","AL-Ahli",64,1.69,"Meio-campista",{12,07,1985},0},
     {35,"Salman Al-Faraj","Arábia Saudita","AL-Hilal",72,1.75,"Meio-campista",{12,07,1985},0},
     {36,"Yahya Al-Shehri","Arábia Saudita","CD Leganés",60,1.64,"Meio-campista",{12,07,1985},0},
     {37,"Salman Al-Moasher","Arábia Saudita","AL-Ahli",62,1.65,"Meio-campista",{12,07,1985},0},
     {38,"Mohammad Al-Sahlawi","Arábia Saudita","Al-Nassr",72,1.80,"Atacante",{12,07,1985},0},
     {39,"Fahad Al-Muwallad","Arábia Saudita","Levante UD",59,1.67,"Atacante",{12,07,1985},0},
     {40,"ESCUDO DO EGITO","Egito","-----",0,0,"-----",{0,0,0},1},
     {41,"TIME DO EGITO","Egito","-----",0,0,"-----",{0,0,0},0},
     {42,"Essam El Hadary","Egito","Al-Taawoun",87,1.88,"Goleiro",{15,01,1973},0},
     {43,"Ali Gabr","Egito","West Bromwich Albion",82,1.93,"Defensor",{10,07,1989},0},
     {44,"Ahmed Elmohamady","Egito","Aston Villa",75,1.83,"Defensor",{9,9,1987},0},
     {45,"Omar Gaber","Egito","Los Angeles",71,1.74,"Defensor",{30,1,1992},0},
     {46,"Ramy Rabia","Egito","Al Ahly",80,1.86,"Defensor",{20,5,1993},0},
     {47,"Ahmed Hegazi","Egito","West Bromwich Albion",83,1.93,"Defensor",{25,1,1991},0},
     {48,"Tarek Hamed","Egito","Zamalek",74,1.79,"Meio-campista",{24,10,1988},0},
     {49,"Mohahmed Elneny","Egito","Arsenal",70,1.80,"Meio-campista",{11,07,1992},0},
     {50,"Trezeguet","Egito","Kasimpasa SK",71,1.79,"Meio-campista",{1,10,1994},0},
     {51,"Mohamed Salah","Egito","Liverpool FC",71,1.75,"Atacante",{15,06,1992},0},
     {52,"Amr Gamal","Egito","Bidvest Wits",72,1.70,"Atacante",{3,8,1991},0},
     {53,"ESCUDO DO URUGUAI","Uruguai","-----",0,0,"-----",{0,0,0},1},
     {54,"TIME DO URUGUAI","Uruguai","-----",0,0,"-----",{0,0,0},0},
     {55,"Fernando Muslera","Uruguai","Galatasaray AS",74,1.90,"Goleiro",{16,07,1986},0},
     {56,"Maxi Pereira","Uruguai","Porto FC",65,1.75,"Defensor",{1,7,1984},0},
     {57,"Diego Godín","Uruguai","Atlético de Madrid",79,1.87,"Defensor",{16,2,1986},0},
     {58,"Martín Caceres","Uruguai","Lazio",78,1.80,"Defensor",{7,04,1987},0},
     {59,"José Gimenez","Uruguai","Atlético de Madrid",77,1.85,"Defensor",{20,1,1995},0},
     {60,"Sebástian Coates","Uruguai","Sporting",92,1.90,"Defensor",{5,3,1989},0},
     {61,"Arévalo Ríos","Uruguai","Egito",68,1.78,"Defensor",{2,03,1981},0},
     {62,"Carlos Sánchez","Uruguai","Monterrey",69,1.71,"Meio-campista",{2,07,1990},0},
     {63,"Matías Veccino","Uruguai","Inter de Milão",81,1.87,"Meio-campista",{1,4,1990},0},
     {64,"Nicolás Lodeiro","Uruguai","Seattle Sounders",68,1.70,"Meio-campista",{19,03,1989},0},
     {65,"Luis Suaréz","Uruguai","Barcelona",80,1.85,"Atacante",{24,01,1987},0},
     {66,"ESCUDO DE PORTUGAL","Portugal","-----",0,0,"-----",{0,0,0},1},
     {67,"TIME DE PORTUGAL","Portugal","-----",0,0,"-----",{0,0,0},0},
     {68,"Rui Patrício","Portugal","Sporting",86,1.90,"Goleiro",{5,7,1988},0},
     {69,"Bruno Alves","Portugal","Rangers FC",81,1.88,"Defensor",{26,2,1988},0},
     {70,"Pepe","Portugal","Besiktas",83,1.88,"Defensor",{2,12,1983},0},
     {71,"José Fonte","Portugal","West Ham",81,1.90,"Defensor",{12,2,1991},0},
     {72,"Eliseu","Portugal","Benfica",71,1.75,"Defensor",{22,1,1990},0},
     {73,"João Mário","Portugal","West Ham",76,1.79,"Meio-campista",{23,9,1989},0},
     {74,"William Carvalho","Portugal","Sporting",85,1.90,"Meio-campista",{9,3,1993},0},
     {75,"Ricardo Quaresma","Portugal","Besiktas",71,1.74,"Meio-campista",{29,9,1989},0},
     {76,"André Silva","Portugal","Milan",79,1.80,"Atacante",{2,12,1981},0},
     {77,"Gelson Martins","Portugal","Sporting",73,1.70,"Atacante",{7,7,1991},0},
     {78,"Cristiano Ronaldo","Portugal","Juventus",83,1.87,"Atacante",{5,2,1985},0},
     {79,"ESCUDO DA ESPANHA","Espanha","-----",0,0,"-----",{0,0,0},1},
     {80,"TIME DA ESPANHA","Espanha","-----",0,0,"-----",{0,0,0},0},
     {81,"De Gea","Espanha","Manchester United",0,0,"-----",{0,0,0},0},
     {82,"Sergio Ramos","Espanha","Real Madrid",0,0,"-----",{0,0,0},0},
     {83,"Jordi ALba","Espanha","Barcelona",0,0,"-----",{0,0,0},0},
     {84,"Gerard Piqué","Espanha","Barcelona",0,0,"-----",{0,0,0},0},
     {85,"Sergio Busquets","Espanha","Barcelona",0,0,"-----",{0,0,0},0},
     {86,"Saúl Níguez","Espanha","Atlético de Madrid",0,0,"-----",{0,0,0},0},
     {87,"Isco","Espanha","Real Madrid",0,0,"-----",{0,0,0},0},
     {88,"Iniesta","Espanha","Barcelona",0,0,"-----",{0,0,0},0},
     {89,"Diego Costa","Espanha","Atlético de Madrid",0,0,"-----",{0,0,0},0},
     {90,"Rodrigo","Espanha","Valencia",0,0,"-----",{0,0,0},0},
     {91,"Iago Aspas","Espanha","Deportivo",0,0,"-----",{0,0,0},0},
     {92,"ESCUDO DE MARROCOS","Marrocos","-----",0,0,"-----",{0,0,0},1},
     {93,"TIME DE MARROCOS","Marrocos","-----",0,0,"-----",{0,0,0},0},
     {94,"Munir Mohamedi","Marrocos","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {95,"Medhi Benatia","Marrocos","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {96,"Nabil Dirar","Marrocos","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {97,"Romain Saiss","Marrocos","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {98,"Fouad Chafik","Marrocos","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {99,"Karim El Hamadi","Marrocos","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {100,"Hakim Zyech","Marrocos","Real Madrid",70,1.70,"Meia Atacante",{12,07,1985},0},
     {101,"Nordin Amrabat","Marrocos","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {102,"Rachid Alioui","Marrocos","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {103,"Khalid Boutaib","Marrocos","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {104,"Youssef En-Nesyri","Marrocos","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {105,"ESCUDO DO IRÃ","Irã","-----",0,0,"-----",{0,0,0},1},
     {106,"TIME DO IRÃ","Irã","-----",0,0,"-----",{0,0,0},0},
     {107,"Alireza Beiranvand","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {108,"Pejman Montarezi","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {109,"Vouria Ghafouri","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {110,"Jalal Hosseini","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {111,"Milad Mohammadi","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {112,"Omid Ebrahimi","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {113,"Saeid Ezatolahi","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {114,"Vahid Amiri","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {115,"Mehdi Taremi","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {116,"Alireza Jahanbakhsh","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {117,"Sardar Azmoun","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {118,"ESCUDO DA FRANÇA","França","-----",0,0,"-----",{0,0,0},1},
     {119,"TIME DA FRANÇA","Croacia","Monaco",0,0,"-----",{0,0,0},0},
     {120,"Hugo Lloris","França","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {121,"Pavard","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {122,"Raphael Varane","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {123,"Samuel Umtiti","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {124,"Lucas Digne","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {125,"Blaise Matuidi","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {126,"Ngolo Kante","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {127,"Paul Pogba","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {128,"Antoine Griezman","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {129,"Kylian Mbappé","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {130,"Olivier Giroud","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {131,"ESCUDO DA AUSTRÁLIA","Austrália","-----",0,0,"-----",{0,0,0},1},
     {132,"TIME DA AUSTRÁLIA","Austrália","-----",0,0,"-----",{0,0,0},0},
     {133,"Mathew Ryan","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {134,"Milos Degenek","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {135,"Bailey Wright","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {136,"Ryan Mcgowan","Croacia","Real Madrid",70,1.70,"Meia Atacante",{12,07,1985},0},
     {137,"Mark Miligan","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {138,"Aaron Mooy","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {139,"James Troisi","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {140,"Mile Jedinak","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {141,"Tim Cahill","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {142,"Mathew Leckie","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {143,"Tomi Juric","Croacia","Real Madrid",70,1.70,"Meia",{12,07,1985},0},
     {144,"ESCUDO DO PERU","Peru","-----",0,0,"-----",{0,0,0},1},
     {145,"TIME DO PERU","Peru","-----",0,1.0,"-----",{0,0,0},0},
     {146,"Carlos Cáceda","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {147,"Aldo Corzo","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {148,"Miguel Trauco","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {149,"Luis Advíncula","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {150,"Miguel Araujo","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {151,"Christian Cueva","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {152,"Andy Polo","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {153,"Yoshimar Yotun","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {154,"Edison Flores","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {155,"Paolo Guerrero","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {156,"Raul Ruidiaz","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},1},
     {157,"ESCUDO DA DINAMARCA","Dinamarca","-----",0,0,"-----",{0,0,0},1},
     {158,"TIME DA DINAMARCA","Dinamarca","-----",0,0,"-----",{0,0,0},0},
     {159,"Kasper Schmeichel","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {160,"Jannik Vestergard","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {161,"Andreas Christensen","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {162,"Peter Ankersen","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {163,"Christian Eriksen","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {164,"Lasse Schone","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {165,"Pione Sisto","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {166,"Yussuf Poulsen","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {167,"Andreas Cornelius","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {168,"Nicklas Bendtner","Croacia","Monaco",70,1.70,"Goleiro",{12,07,1985},0},
     {169,"Thomas Delaney","Croacia","Real Madrid",70,1.70,"Meia Atacante",{12,07,1985},0},
     {170,"ESCUDO DA ARGENTINA","Argentina","-----",0,0,"-----",{0,0,0},1},
     {171,"TIME DA ARGENTINA","Argentina","-----",0,0,"-----",{0,0,0},0},
     {172,"Sergio Romero","País","Time",0,0,"Posição",{0,0,0},0},
     {173,"Gabriel Mercado","País","Time",0,0,"Posição",{0,0,0},0},
     {174,"Federico Fazio","País","Time",0,0,"Posição",{0,0,0},0},
     {175,"Javier Mascherano","País","Time",0,0,"Posição",{0,0,0},0},
     {176,"Nicolás Otamendi","País","Time",0,0,"Posição",{0,0,0},0},
     {177,"Lucas Biglia","País","Time",0,0,"Posição",{0,0,0},0},
     {178,"Enzo Perez","País","Time",0,0,"Posição",{0,0,0},0},
     {179,"Angel Di Maria","País","Time",0,0,"Posição",{0,0,0},0},
     {180,"Ever banega","País","Time",0,0,"Posição",{0,0,0},0},
     {181,"Lionel Messi","País","Time",0,0,"Posição",{0,0,0},0},
     {182,"Sergio Aguero","País","Time",0,0,"Posição",{0,0,0},0},
     {183,"ESCUDO DA ISLÂNDIA","Islândia","-----",0,0,"-----",{0,0,0},1},
     {184,"TIME DA ISLÂNDIA","-----","-----",0,0,"-----",{0,0,0},0},
     {185,"Hannes Halldorsson","País","Time",0,0,"Posição",{0,0,0},0},
     {186,"Ragnar Sigurdsson","País","Time",0,0,"Posição",{0,0,0},0},
     {187,"Kári Arnason","País","Time",0,0,"Posição",{0,0,0},0},
     {188,"Ari Skulason","País","Time",0,0,"Posição",{0,0,0},0},
     {189,"Sverrir Ingason","País","Time",0,0,"Posição",{0,0,0},0},
     {190,"Gylfi Sigurdson","País","Time",0,0,"Posição",{0,0,0},0},
     {191,"Arnor Ingvi","País","Time",0,0,"Posição",{0,0,0},0},
     {192,"Rurik Gíslason","País","Time",0,0,"Posição",{0,0,0},0},
     {193,"Orna Kjartansson","País","Time",0,0,"Posição",{0,0,0},0},
     {194,"Alfred Finnborgason","País","Time",0,0,"Posição",{0,0,0},0},
     {195,"Bjorn Sigurdason","País","Time",0,0,"Posição",{0,0,0},0},
     {196,"ESCUDO DA CROÁCIA","Croácia","-----",0,0,"-----",{0,0,0},1},
     {197,"TIME DA CROÁCIA","Croácia","-----",0,0,"-----",{0,0,0},0},
     {198,"Danijel Subasic","País","Time",0,0,"Posição",{0,0,0},0},
     {199,"Sime Vrsaljko","País","Time",0,0,"Posição",{0,0,0},0},
     {200,"Domagoj Vida","País","Time",0,0,"Posição",{0,0,0},0},
     {201,"Dejan Lovren","País","Time",0,0,"Posição",{0,0,0},0},
     {202,"Josip Pivaric","País","Time",0,0,"Posição",{0,0,0},0},
     {203,"Ivan Rakitic","País","Time",0,0,"Posição",{0,0,0},0},
     {204,"Luka Modric","País","Time",0,0,"Posição",{0,0,0},0},
     {205,"Mateo Kovacic","País","Time",0,0,"Posição",{0,0,0},0},
     {206,"Ivan Perisic","País","Time",0,0,"Posição",{0,0,0},0},
     {207,"Nikola Kalinic","País","Time",0,0,"Posição",{0,0,0},0},
     {208,"Mario Mandzukic","País","Time",0,0,"Posição",{0,0,0},0},
     {209,"ESCUDO DA NIGÉRIA","Nigéria","Time",0,0,"-----",{0,0,0},1},
     {210,"TIME DA NIGÉRIA","Nigéria","-----",0,0,"-----",{0,0,0},0},
     {211,"Ikechukwu Ezenwa","País","Time",0,0,"Posição",{0,0,0},0},
     {212,"Elderson Echiéjilé","País","Time",0,0,"Posição",{0,0,0},0},
     {213,"Shehu Abdullahi","País","Time",0,0,"Posição",{0,0,0},0},
     {214,"Leon Balogun","País","Time",0,0,"Posição",{0,0,0},0},
     {215,"Ola Aina","País","Time",0,0,"Posição",{0,0,0},0},
     {216,"Ogeny Onazi","País","Time",0,0,"Posição",{0,0,0},0},
     {217,"Etebo Oghenekaro","País","Time",0,0,"Posição",{0,0,0},0},
     {218,"Victor Moses","País","Time",0,0,"Posição",{0,0,0},0},
     {219,"Obi Mikel","País","Time",0,0,"Posição",{0,0,0},0},
     {220,"Alex Iwobi","País","Time",0,0,"Posição",{0,0,0},0},
     {221,"Ahmed Musa","País","Time",0,0,"Posição",{0,0,0},0},
     {222,"ESCUDO DO BRASIL","Brasil","-----",0,0,"-----",{0,0,0},1},
     {223,"TIME DO BRASIL","Brasil","-----",0,0,"-----",{0,0,0},0},
     {224,"Alisson","País","Time",0,0,"Posição",{0,0,0},0},
     {225,"Marcelo","País","Time",0,0,"Posição",{0,0,0},0},
     {226,"Danilo","País","Time",0,0,"Posição",{0,0,0},0},
     {227,"Miranda","País","Time",0,0,"Posição",{0,0,0},0},
     {228,"Thiago Silva","País","Time",0,0,"Posição",{0,0,0},0},
     {229,"Casemiro","País","Time",0,0,"Posição",{0,0,0},0},
     {230,"Paulinho","País","Time",0,0,"Posição",{0,0,0},0},
     {231,"Willian","País","Time",0,0,"Posição",{0,0,0},0},
     {232,"Philippe Coutinho","País","Time",0,0,"Posição",{0,0,0},0},
     {233,"Neymar","País","Time",0,0,"Posição",{0,0,0},0},
     {234,"Gabriel Jesus","País","Time",0,0,"Posição",{0,0,0},0},
     {235,"ESCUDO DA SUIÇA","Suiça","-----",0,0,"-----",{0,0,0},1},
     {236,"TIME DA SUIÇA","País","-----",0,0,"-----",{0,0,0},0},
     {237,"Yann Sommer","País","Time",0,0,"Posição",{0,0,0},0},
     {238,"Stephan Lichtsteiner","País","Time",0,0,"Posição",{0,0,0},0},
     {239,"Michael Lang","País","Time",0,0,"Posição",{0,0,0},0},
     {240,"Johan Djorou","País","Time",0,0,"Posição",{0,0,0},0},
     {241,"Ricardo Rodriguez","País","Time",0,0,"Posição",{0,0,0},0},
     {242,"Fabian Schar","País","Time",0,0,"Posição",{0,0,0},0},
     {243,"Steven Zuber","País","Time",0,0,"Posição",{0,0,0},0},
     {244,"Valon Behrami","País","Time",0,0,"Posição",{0,0,0},0},
     {245,"Xherdan Shaqiri","País","Time",0,0,"Posição",{0,0,0},0},
     {246,"Haris Seferovic","País","Time",0,0,"Posição",{0,0,0},0},
     {247,"Admir Mehmedi","País","Time",0,0,"Posição",{0,0,0},0},
     {248,"ESCUDO DA COSTA RICA","Costa Rica","-----",0,0,"-----",{0,0,0},1},
     {249,"TIME DA COSTA RICA","Costa Rica","-----",0,0,"-----",{0,0,0},0},
     {250,"Keylor Navas","País","Time",0,0,"Posição",{0,0,0},0},
     {251,"Giancarlo González","País","Time",0,0,"Posição",{0,0,0},0},
     {252,"Christian Gamboa","País","Time",0,0,"Posição",{0,0,0},0},
     {253,"Bryan Oviedo","País","Time",0,0,"Posição",{0,0,0},0},
     {254,"Francisco Calvo","País","Time",0,0,"Posição",{0,0,0},0},
     {255,"Johnny Acosta","País","Time",0,0,"Posição",{0,0,0},0},
     {256,"Bryan Ruiz","País","Time",0,0,"Posição",{0,0,0},0},
     {257,"Celso Borges","País","Time",0,0,"Posição",{0,0,0},0},
     {258,"Randall Azoeifa","País","Time",0,0,"Posição",{0,0,0},0},
     {259,"Joel Campbell","País","Time",0,0,"Posição",{0,0,0},0},
     {260,"Marco Ureña","País","Time",0,0,"Posição",{0,0,0},0},
     {261,"ESCUDO DA SÉRVIA","Sérvia","-----",0,0,"-----",{0,0,0},1},
     {262,"TIME DA SÉRVIA","Sériva","-----",0,0,"-----",{0,0,0},0},
     {263,"Vladmir Stojkovic","País","Time",0,0,"Posição",{0,0,0},0},
     {264,"Branislav Ivanovic","País","Time",0,0,"Posição",{0,0,0},0},
     {265,"Aleksandar Kolarov","País","Time",0,0,"Posição",{0,0,0},0},
     {266,"Antonio Rukavina","País","Time",0,0,"Posição",{0,0,0},0},
     {267,"Matija Nastasic","País","Time",0,0,"Posição",{0,0,0},0},
     {268,"Nemanja Matic","País","Time",0,0,"Posição",{0,0,0},0},
     {269,"Adem Ljajic","País","Time",0,0,"Posição",{0,0,0},0},
     {270,"Nemanja Gudelj","País","Time",0,0,"Posição",{0,0,0},0},
     {271,"Filip Kostic","País","Time",0,0,"Posição",{0,0,0},0},
     {272,"Aleksandar Mitrovic","País","Time",0,0,"Posição",{0,0,0},0},
     {273,"Aleksandar Prijovic","País","Time",0,0,"Posição",{0,0,0},0},
     {274,"ESCUDO DA ALEMANHA","Alemanha","-----",0,0,"-----",{0,0,0},1},
     {275,"TIME DA ALEMANHA","Alemanha","-----",0,0,"-----",{0,0,0},0},
     {276,"Manuel Neuer","País","Time",0,0,"Posição",{0,0,0},0},
     {277,"Joshua Kimmich","País","Time",0,0,"Posição",{0,0,0},0},
     {278,"Jerome Boateng","País","Time",0,0,"Posição",{0,0,0},0},
     {279,"Matts Hummels","País","Time",0,0,"Posição",{0,0,0},0},
     {280,"Jonas Hector","País","Time",0,0,"Posição",{0,0,0},0},
     {281,"Tony Kroos","País","Time",0,0,"Posição",{0,0,0},0},
     {282,"Leon Goretzka","País","Time",0,0,"Posição",{0,0,0},0},
     {283,"Sami Khedira","País","Time",0,0,"Posição",{0,0,0},0},
     {284,"Mesut Ozil","País","Time",0,0,"Posição",{0,0,0},0},
     {285,"Timo Werner","País","Time",0,0,"Posição",{0,0,0},0},
     {286,"Thomas Muller","País","Time",0,0,"Posição",{0,0,0},0},
     {287,"ESCUDO DO MÉXICO","México","-----",0,0,"-----",{0,0,0},1},
     {288,"TIME DO MÉXICO","México","-----",0,0,"-----",{0,0,0},0},
     {289,"Guillermo Ochoa","País","Time",0,0,"Posição",{0,0,0},0},
     {290,"Diego Reyes","País","Time",0,0,"Posição",{0,0,0},0},
     {291,"Hector Moreno","País","Time",0,0,"Posição",{0,0,0},0},
     {292,"Miguel Layun","País","Time",0,0,"Posição",{0,0,0},0},
     {293,"Jesus Gallardo","País","Time",0,0,"Posição",{0,0,0},0},
     {294,"Andrés Guardado","País","Time",0,0,"Posição",{0,0,0},0},
     {295,"Hécto Herrera","País","Time",0,0,"Posição",{0,0,0},0},
     {296,"Jésus Corona","País","Time",0,0,"Posição",{0,0,0},0},
     {297,"Hirving Lozano","País","Time",0,0,"Posição",{0,0,0},0},
     {298,"Carlos Vela","País","Time",0,0,"Posição",{0,0,0},0},
     {299,"Javier Hernandez","País","Time",0,0,"Posição",{0,0,0},0},
     {300,"ESCUDO DA SUÉCIA","Suécia","-----",0,0,"-----",{0,0,0},0},
     {301,"TIME DA SUÉCIA","Suécia","-----",0,0,"-----",{0,0,0},0},
     {302,"Robin Olsen","País","Time",0,0,"Posição",{0,0,0},0},
     {303,"Mikael Lustig","País","Time",0,0,"Posição",{0,0,0},0},
     {304,"Andreas Granqvist","País","Time",0,0,"Posição",{0,0,0},0},
     {305,"Martin Olsson","País","Time",0,0,"Posição",{0,0,0},0},
     {306,"Luwig Augustinson","País","Time",0,0,"Posição",{0,0,0},0},
     {307,"Emil Forsberg","País","Time",0,0,"Posição",{0,0,0},0},
     {308,"Jimmy Durmaz","País","Time",0,0,"Posição",{0,0,0},0},
     {309,"Marcus Berg","País","Time",0,0,"Posição",{0,0,0},0},
     {310,"John Guidetti","País","Time",0,0,"Posição",{0,0,0},0},
     {311,"Ola Toivonen","País","Time",0,0,"Posição",{0,0,0},0},
     {312,"Albin Ekdal","País","Time",0,0,"Posição",{0,0,0},0},
     {313,"ESCUDO DA CORÉIA","Coréia","-----",0,0,"-----",{0,0,0},1},
     {314,"TIME DA CORÉIA","Coréia","-----",0,0,"-----",{0,0,0},0},
     {315,"Kim Seunggyu","País","Time",0,0,"Posição",{0,0,0},0},
     {316,"Kim Younggwon","País","Time",0,0,"Posição",{0,0,0},0},
     {317,"Kim Jinsu","País","Time",0,0,"Posição",{0,0,0},0},
     {318,"Hong Jeongho","País","Time",0,0,"Posição",{0,0,0},0},
     {319,"Jang Hyunsoo","País","Time",0,0,"Posição",{0,0,0},0},
     {320,"Koo Jacheol","País","Time",0,0,"Posição",{0,0,0},0},
     {321,"Ki Sungyueng","País","Time",0,0,"Posição",{0,0,0},0},
     {322,"Nam Taehee","País","Time",0,0,"Posição",{0,0,0},0},
     {323,"Lee Jaesung","País","Time",0,0,"Posição",{0,0,0},0},
     {324,"Heungmin Son","País","Time",0,0,"Posição",{0,0,0},0},
     {325,"Ji Dongwon","País","Time",0,0,"Posição",{0,0,0},0},
     {326,"ESCUDO DA BÉLGICA","Bélgica","-----",0,0,"-----",{0,0,0},1},
     {327,"TIME DA BÉLGICA","Bélgica","-----",0,0,"-----",{0,0,0},0},
     {328,"Thibaut Courtois","País","Time",0,0,"Posição",{0,0,0},0},
     {329,"Jan Vertonghen","País","Time",0,0,"Posição",{0,0,0},0},
     {330,"Vicent Kompany","País","Time",0,0,"Posição",{0,0,0},0},
     {331,"Thomas Meunier","País","Time",0,0,"Posição",{0,0,0},0},
     {332,"Axel Witsel","País","Time",0,0,"Posição",{0,0,0},0},
     {333,"Kevin de Bruyne","País","Time",0,0,"Posição",{0,0,0},0},
     {334,"Mousa Dembelé","País","Time",0,0,"Posição",{0,0,0},0},
     {335,"Nacer Chadli","País","Time",0,0,"Posição",{0,0,0},0},
     {336,"Eden Hazard","País","Time",0,0,"Posição",{0,0,0},0},
     {337,"Dries Mertens","País","Time",0,0,"Posição",{0,0,0},0},
     {338,"Romelu Lukaku","País","Time",0,0,"Posição",{0,0,0},0},
     {339,"ESCUDO DO PANAMÁ","Panamá","-----",0,0,"-----",{0,0,0},1},
     {340,"TIME DO PANAMÁ","Panamá","-----",0,0,"-----",{0,0,0},0},
     {341,"Jaime Penedo","País","Time",0,0,"Posição",{0,0,0},0},
     {342,"Michael Murilo","País","Time",0,0,"Posição",{0,0,0},0},
     {343,"Fidel Escobar","País","Time",0,0,"Posição",{0,0,0},0},
     {344,"Román Torres","País","Time",0,0,"Posição",{0,0,0},0},
     {345,"Eric Davis","País","Time",0,0,"Posição",{0,0,0},0},
     {346,"Felipe Baloy","País","Time",0,0,"Posição",{0,0,0},0},
     {347,"Edgar Barcenas","País","Time",0,0,"Posição",{0,0,0},0},
     {348,"Armando Cooper","País","Time",0,0,"Posição",{0,0,0},0},
     {349,"Anibal Godoy","País","Time",0,0,"Posição",{0,0,0},0},
     {350,"Alberto Quintero","País","Time",0,0,"Posição",{0,0,0},0},
     {351,"Abdiel Arroyo","País","Time",0,0,"Posição",{0,0,0},0},
     {352,"ESCUDO DA TUNÍSIA","Tunísia","-----",0,0,"-----",{0,0,0},1},
     {353,"TIME DA TUNÍSIA","Tunísia","-----",0,0,"-----",{0,0,0},0},
     {354,"Aymen Mathlouthi","País","Time",0,0,"Posição",{0,0,0},0},
     {355,"Ali Maaloul","País","Time",0,0,"Posição",{0,0,0},0},
     {356,"Aymen Abdennour","País","Time",0,0,"Posição",{0,0,0},0},
     {357,"Hamdi Naguez","País","Time",0,0,"Posição",{0,0,0},0},
     {358,"Yassine Meriah","País","Time",0,0,"Posição",{0,0,0},0},
     {359,"Oussama Haddadi","País","Time",0,0,"Posição",{0,0,0},0},
     {360,"Youssef Msakni","País","Time",0,0,"Posição",{0,0,0},0},
     {361,"Anice Badri","País","Time",0,0,"Posição",{0,0,0},0},
     {362,"Naim Sliti","País","Time",0,0,"Posição",{0,0,0},0},
     {363,"Wahni Khazri","País","Time",0,0,"Posição",{0,0,0},0},
     {364,"Amine Ben Amor","País","Time",0,0,"Posição",{0,0,0},0},
     {365,"ESCUDO DA INGLATERRA","Inglaterra","-----",0,0,"-----",{0,0,0},1},
     {366,"TIME DA INGLATERRA","Inglaterra","-----",0,0,"-----",{0,0,0},0},
     {367,"Jordan Pickford","País","Time",0,0,"Posição",{0,0,0},0},
     {368,"Gary Cahill","País","Time",0,0,"Posição",{0,0,0},0},
     {369,"Kyle Walker","País","Time",0,0,"Posição",{0,0,0},0},
     {370,"Ryan Bertrand","País","Time",0,0,"Posição",{0,0,0},0},
     {371,"Ashley Young","País","Time",0,0,"Posição",{0,0,0},0},
     {372,"Jordan Henderson","País","Time",0,0,"Posição",{0,0,0},0},
     {373,"Adam Lalanna","País","Time",0,0,"Posição",{0,0,0},0},
     {374,"Harry Kane","País","Time",0,0,"Posição",{0,0,0},0},
     {375,"Jamie Vardy","País","Time",0,0,"Posição",{0,0,0},0},
     {376,"Marcus Rashford","País","Time",0,0,"Posição",{0,0,0},0},
     {377,"Jesse Lingard","País","Time",0,0,"Posição",{0,0,0},0},
     {378,"ESCUDO DA POLÔNIA","Polônia","-----",0,0,"-----",{0,0,0},1},
     {379,"TIME DA POLÔNIA","Polônia","-----",0,0,"-----",{0,0,0},0},
     {380,"Lukasz Fabianski","País","Time",0,0,"Posição",{0,0,0},0},
     {381,"Lukasz Piszczek","País","Time",0,0,"Posição",{0,0,0},0},
     {382,"Kamil Glik","País","Time",0,0,"Posição",{0,0,0},0},
     {383,"Thiago Cionek","País","Time",0,0,"Posição",{0,0,0},0},
     {384,"Bartosz Berezinski","País","Time",0,0,"Posição",{0,0,0},0},
     {385,"Kamil Grosicki","País","Time",0,0,"Posição",{0,0,0},0},
     {386,"Piotr Zielinski","País","Time",0,0,"Posição",{0,0,0},0},
     {387,"Robert Lewandowski","País","Time",0,0,"Posição",{0,0,0},0},
     {388,"Lukasz Teodorczyk","País","Time",0,0,"Posição",{0,0,0},0},
     {389,"Karol Linetty","País","Time",0,0,"Posição",{0,0,0},0},
     {390,"Maciej Rybus","País","Time",0,0,"Posição",{0,0,0},0},
     {391,"ESCUDO DE SENEGAL","Senegal","-----",0,0,"-----",{0,0,0},1},
     {392,"TIME DE SENEGAL","Senegal","-----",0,0,"-----",{0,0,0},0},
     {393,"Khadim N'diaye","País","Time",0,0,"Posição",{0,0,0},0},
     {394,"Kara Mbodj","País","Time",0,0,"Posição",{0,0,0},0},
     {395,"Kalidou Koulibaily","País","Time",0,0,"Posição",{0,0,0},0},
     {396,"Salif Sané","País","Time",0,0,"Posição",{0,0,0},0},
     {397,"Idrissa Gueye","País","Time",0,0,"Posição",{0,0,0},0},
     {398,"Cheikhou kouyate","País","Time",0,0,"Posição",{0,0,0},0},
     {399,"Sadio Mané","País","Time",0,0,"Posição",{0,0,0},1},
     {400,"Moussa Sow","País","Time",0,0,"Posição",{0,0,0},0},
     {401,"Moussa Konaté","País","Time",0,0,"Posição",{0,0,0},0},
     {402,"Keita Baldé","País","Time",0,0,"Posição",{0,0,0},0},
     {403,"Mame Diouf","País","Time",0,0,"Posição",{0,0,0},0},
     {404,"ESCUDO DA COLÔMBIA","Colômbia","-----",0,0,"-----",{0,0,0},1},
     {405,"TIME DA COLÔMBIA","Colômbia","-----",0,0,"-----",{0,0,0},0},
     {406,"David Ospina","País","Time",0,0,"Posição",{0,0,0},0},
     {407,"Yerry Mina","País","Time",0,0,"Posição",{0,0,0},0},
     {408,"Davinson Sanchez","País","Time",0,0,"Posição",{0,0,0},0},
     {409,"Santiago Arias","País","Time",0,0,"Posição",{0,0,0},0},
     {410,"Frank Fabra","País","Time",0,0,"Posição",{0,0,0},0},
     {411,"Carlos Sanchez","País","Time",0,0,"Posição",{0,0,0},0},
     {412,"James Rodriguez","País","Time",0,0,"Posição",{0,0,0},0},
     {413,"Wilmar Barrios","País","Time",0,0,"Posição",{0,0,0},0},
     {414,"Teófilo Gutierez","País","Time",0,0,"Posição",{0,0,0},0},
     {415,"Radamel Falcão","País","Time",0,0,"Posição",{0,0,0},0},
     {416,"Yimmi Chará","País","Time",0,0,"Posição",{0,0,0},0},
     {417,"ESCUDO DO JAPÃO","Japão","-----",0,0,"-----",{0,0,0},1},
     {418,"TIME DO JAPÃO","Japão","-----",0,0,"-----",{0,0,0},0},
     {419,"Eiji Kawashima","País","Time",0,0,"Posição",{0,0,0},0},
     {420,"Masato Morishiege","País","Time",0,0,"Posição",{0,0,0},0},
     {421,"Yuto Nagatomo","País","Time",0,0,"Posição",{0,0,0},0},
     {422,"Gotoku Sakai","País","Time",0,0,"Posição",{0,0,0},0},
     {423,"Tomoaki Makino","País","Time",0,0,"Posição",{0,0,0},0},
     {424,"Maya Yoshida","País","Time",0,0,"Posição",{0,0,0},0},
     {425,"Shinji Kagawa","País","Time",0,0,"Posição",{0,0,0},0},
     {426,"Keisuke Honda","País","Time",0,0,"Posição",{0,0,0},0},
     {427,"Takashi Usami","País","Time",0,0,"Posição",{0,0,0},0},
     {428,"Yuya Osako","País","Time",0,0,"Posição",{0,0,0},0},
     {429,"Shinji Okazaki","País","Time",0,0,"Posição",{0,0,0},0},
     };

void Mostra_pagina()
{
  int auxiliar6;
  int auxpag,tam_vet,buscafig,veiodapagina,auxiliar10;
  printf("                                                                                             ");
  linha(25,'-');
  printf("\n                                                                                                 ");
  switch (auxiliar7)
  {

      case 0:{printf("COPA RUSSIA 2018\n");break;}
      case 13:{printf("SELEÇÃO DA RUSSIA\n");break;}
      case 26:{printf("SELEÇÃO DA ARÁBIA SAUDITA\n");break;}
      case 39:{printf("SELEÇÃO DO EGITO\n");break;}
      case 52:{printf("SELEÇÃO DO URUGUAI\n");break;}
      case 65:{printf("SELEÇÃO DE PORTUGAL\n");break;}
      case 78:{printf("SELEÇÃO DA ESPANHA\n");break;}
      case 91:{printf("SELEÇÃO DE MARROCOS\n");break;}
      case 104:{printf("SELEÇÃO DO IRÃ\n");break;}
      case 117:{printf("SELEÇÃO DA FRANÇA\n");break;}
      case 130:{printf("SELEÇÃO DA AUSTRÁLIA\n");break;}
      case 143:{printf("SELEÇÃO DO PERU\n");break;}
      case 156:{printf("SELEÇÃO DA DINAMARCA\n");break;}
      case 169:{printf("SELEÇÃO DA ARGENTINA\n");break;}
      case 182:{printf("SELEÇÃO DA ISLANDIA\n");break;}
      case 195:{printf("SELEÇÃO DA CROÁCIA\n");break;}
      case 208:{printf("SELEÇÃO DA NIGÉRIA\n");break;}
      case 221:{printf("SELEÇÃO DO BRASIL\n");break;}
      case 234:{printf("SELEÇÃO DA SUIÇA\n");break;}
      case 247:{printf("SELEÇÃO DA COSTA RICA\n");break;}
      case 260:{printf("SELEÇÃO DA SÉRVIA\n");break;}
      case 273:{printf("SELEÇÃO DA ALEMANHA\n");break;}
      case 286:{printf("SELEÇÃO DO MÉXICO\n");break;}
      case 299:{printf("SELEÇÃO DA SUÉCIA\n");break;}
      case 312:{printf("SELEÇÃO DA CORÉIA\n");break;}
      case 325:{printf("SELEÇÃO DA BÉLGICA\n");break;}
      case 338:{printf("SELEÇÃO DO PANAMÁ\n");break;}
      case 351:{printf("SELEÇÃO DA TUNÍSIA\n");break;}
      case 364:{printf("SELEÇÃO DA INGLATERRA\n");break;}
      case 377:{printf("SELEÇÃO DA POLÔNIA\n");break;}
      case 390:{printf("SELEÇÃO DE SENEGAL\n");break;}
      case 403:{printf("SELEÇÃO DA COLÔMBIA\n");break;}
      case 416:{printf("SELEÇÃO DO JAPÃO\n");break;}
  }
  printf("                                                                                             ");
  linha(25,'-');
  printf("\n");


  for (auxiliar6=1;auxiliar6<13;auxiliar6++)
  {
      if (auxiliar6==1)
        {
           tam_vet=strlen(jogadores[auxiliar6+auxiliar7].nome);
           linha(tam_vet+4,'-');
           printf("\n| %s | ( %i )  ",jogadores[auxiliar6+auxiliar7].nome,auxiliar6+auxiliar7);
           colada(auxiliar6+auxiliar7,figurinhas_coladas);
           printf("    %s ( %i )",jogadores[auxiliar6+1+auxiliar7].nome,auxiliar6+auxiliar7+1);
           colada(auxiliar6+1+auxiliar7,figurinhas_coladas);
           printf("\n");
           linha(tam_vet+4,'-');
        }
    else
        {
        printf("\n\n\n    %s ( %i )",jogadores[auxiliar6+auxiliar7+1].nome,auxiliar6+auxiliar7+1);
        colada(auxiliar6+auxiliar7+1,figurinhas_coladas);
        }
    }

  switch (auxiliar7)
   {
   case 0:
    { printf("\n\n\n\n\n0-Sair                              1-Informações sobre uma figurinha                              2-Proxima pagina\n");
      break;
    }
       case 416:
    {
        printf("\n\n\n\n\n0-Sair                              1-Informações sobre uma figurinha                              2-Voltar para o menu\n");
        break;
     }
  default:
    {
     printf("\n\n\n\n\n0-Pagina anterior                   1-Informações sobre uma figurinha                              2-Proxima pagina\n");
     break;
    }
   }

if (auxiliar7==416)
{
scanf("%i",&auxpag);
switch (auxpag)
  {  case 2:
      {
          system("cls");
          menu_album();
          break;
      }
    case 0:
        {
            system("cls");
            if (auxiliar7>0)
            {auxiliar7=auxiliar7-13;
            Mostra_pagina();}
            else
            menu_album();
            break;
        }
    case 1:
        {
            printf("\nDigite o numero da figurinha:");
            scanf("%i",&buscafig);
            system("cls");
            Mostrar(buscafig);
            printf("\n\n                               1-Voltar para pagina\n");
            scanf("%i",&auxiliar10);
             while (auxiliar10!=1)
              {
                  scanf("%i",&auxiliar10);
              }
              system("cls");
              Mostra_pagina();




            break;
        }
     default:{
     printf("Digite 0 para voltar e 2 para avançar");}
  }}
else
{
   scanf("%i",&auxpag);
switch (auxpag)
  {  case 2:
      {
          system("cls");
          auxiliar7=auxiliar7+13;
          Mostra_pagina();
          break;
      }
    case 0:
        {
            system("cls");
            if (auxiliar7>0)
            {auxiliar7=auxiliar7-13;
            Mostra_pagina();}
            else
            menu_album();
            break;
        }
    case 1:
        {
            printf("\nDigite o numero da figurinha:");
            scanf("%i",&buscafig);
            system("cls");
            Mostrar(buscafig);
            printf("\n\n                               1-Voltar para pagina\n");
            scanf("%i",&auxiliar10);
             while (auxiliar10!=1)
              {
                  scanf("%i",&auxiliar10);
              }
              system("cls");
              Mostra_pagina();




            break;
        }
     default:{
     printf("Digite 0 para voltar e 2 para avançar");}
  }
}

}

void Mostrar (int numerodafig)
{
    printf("\n");
    if (jogadores[numerodafig].raro==1)
        printf("Figurinha Brilhante!\n");
    printf("Número:     %d\n",jogadores[numerodafig].num_fig);
    printf("Nome:       %s\n",jogadores[numerodafig].nome);
    printf("Dt. nasc:   %d-%d-%d\n",jogadores[numerodafig].nasc.dia,jogadores[numerodafig].nasc.mes,jogadores[numerodafig].nasc.ano);
    printf("País:       %s\n",jogadores[numerodafig].pais);
    printf("Time atual: %s\n",jogadores[numerodafig].time);
    printf("Peso:       %d kg\n",jogadores[numerodafig].peso);
    printf("Altura:     %.2f m\n",jogadores[numerodafig].altura);
    printf("Posição:    %s\n",jogadores[numerodafig].posicao);






}

void ver_se_possui(int num_figurinha, int vetor_figurinhas[600], int vetor_repetidas[600])
{
    int auxiliar1,auxiliar2,auxiliar3,auxiliar4=0;

    for (auxiliar1=0;auxiliar1<600;auxiliar1++)
    {
        if (vetor_figurinhas[auxiliar1]== num_figurinha)
           {
             printf("\nVocê possui a figurinha %i colada no seu álbum!\n", num_figurinha);
             auxiliar2=1;
             break;
           }
    }
    if (auxiliar2!=1)
        printf("\nVocê ainda não possui essa figurinha!\n", num_figurinha);

    for (auxiliar3=0;auxiliar3<600;auxiliar3++)
    {
        if (vetor_repetidas[auxiliar3]== num_figurinha)
        { auxiliar4++;
        }

    }
   if (auxiliar4>0,auxiliar4!=1)
    printf("Você possui %i repetidas dessa figurinha\n",auxiliar4);
   if (auxiliar4==1)
    printf("Você possui %i repetida dessa figurinha\n",auxiliar4);
}


void Compra ()
{
    int i,j,aux,aux3=0,escolha,auxi,aux4,pos;
    int pacotes_comprados=0;
    int pacotes_desejados;
    int moedas;
    moedas=10;
    clock_t t;
    srand((unsigned) clock());

    printf("Voce possui %i moedas",moedas);
    printf("Quantos pacotes gostaria de comprar?\n");
    scanf("%d",&pacotes_desejados);
    if (pacotes_desejados*2 >= moedas)
    {
        pacotes_comprados=pacotes_desejados;
    }
    else
    {
     printf("Você não possui moedas suficientes");

    }
    moedas=moedas-(2*pacotes_comprados);
    printf("Seu novo numero de moedas e:%i",moedas);
    for (j=1;j <= pacotes_comprados;j++)
    {
        printf("\n\nPACOTE NUMERO: %i\n",j);

        for( i = 0 ; i < 5 ; i++ )
        {

            vetorauxiliar[i]=rand() % 429;
            vetorauxiliar[i]++;
            printf("\nFigurinha Nro:%i",vetorauxiliar[i]);

            for (aux=0; aux<600; aux++ )
              {
                  if (vetorauxiliar[i]==figurinhas_coladas[aux])
                    {
                        printf(" (Repetida)",vetorauxiliar[i]);
                        repetidas[numero_de_repetidas]=vetorauxiliar[i];
                        numero_de_repetidas++;
                        aux3=1;
                        break;
                     }


                       }
            if (aux3!=1)
            {
                figurinhas_coladas[numero_do_vetor]=vetorauxiliar[i];


                switch(user_logon)
                {
                case 1:
                       {
                        user0_co = fopen("user0_co.txt","a+");
                        fprintf(user0_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user0_co);

                        break;
                        }

                case 2:
                        {

                        user1_co = fopen("user1_co.txt","a+");
                        fprintf(user1_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user1_co);

                        break;
                        }

                case 3:
                       {

                        user2_co = fopen("user2_co.txt","a+");
                        fprintf(user2_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user2_co);
                        break;

                        }

                case 4:
                    {

                        user3_co = fopen("user1_co.txt","a+");
                        fprintf(user3_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user3_co);
                        break;
                    }

                case 5:
                        {

                          user4_co = fopen("user4_co.txt","a+");
                          fprintf(user4_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                          fclose(user4_co);
                          break;
                        }

                case 6:
                       {

                        user5_co = fopen("user5_co.txt","a+");
                        fprintf(user5_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user5_co);
                        break;
                       }

                case 7:
                       {

                        user6_co = fopen("user6_co.txt","a+");
                        fprintf(user6_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user6_co);
                        break;
                        }
                }

                numero_do_vetor++;

            }
            aux3=0;



            }
        }

ordena_o_vetor(figurinhas_coladas);
ordena_o_vetor(repetidas);

switch(user_logon)
                {
                case 1:
                       {
                        user0_co = fopen("user0_co.txt","a+");
                        while(1)
                        {
                            int r = (char)fgetc(user0_co);
                            int k = 0;
                            i=0;
                            while( !feof(user0_co))
                            {	//read till , or EOF
                                figurinhas_coladas[i] = r;			//store in array
                                r = (char)fgetc(user0_co);
                            }
                                figurinhas_coladas[i]=0;		//make last character of string null
                                if(feof(user0_co)){		//check again for EOF
                                break;
                            }
                            i++;
                        }
                        fclose(user0_co);

                        break;
                        }

                case 2:
                        {

                        user1_co = fopen("user1_co.txt","a+");
                        fprintf(user1_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user1_co);

                        break;
                        }

                case 3:
                       {

                        user2_co = fopen("user2_co.txt","a+");
                        fprintf(user2_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user2_co);
                        break;

                        }

                case 4:
                    {

                        user3_co = fopen("user1_co.txt","a+");
                         while(1)
                        {
                            int r = (char)fgetc(user0_co);
                            int k = 0;
                            i=0;
                            while( !feof(user0_co))
                            {	//read till , or EOF
                                figurinhas_coladas[i] = r;			//store in array
                                r = (char)fgetc(user0_co);
                            }
                                figurinhas_coladas[i]=0;		//make last character of string null
                                if(feof(user0_co)){		//check again for EOF
                                break;
                            }
                            i++;
                        }
                        fclose(user3_co);
                        break;
                    }

                case 5:
                        {

                          user4_co = fopen("user4_co.txt","a+");
                          while(1)
                        {
                            int r = (char)fgetc(user4_co);
                            int k = 0;
                            i=0;
                            while( !feof(user4_co))
                            {	//read till , or EOF
                                figurinhas_coladas[i] = r;			//store in array
                                r = (char)fgetc(user0_co);
                            }
                                figurinhas_coladas[i]=0;		//make last character of string null
                                if(feof(user4_co)){		//check again for EOF
                                break;
                            }
                            i++;
                        }
                          fclose(user4_co);
                          break;
                        }

                case 6:
                       {

                        user5_co = fopen("user5_co.txt","a+");
                        fprintf(user5_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user5_co);
                        break;
                       }

                case 7:
                       {

                        user6_co = fopen("user6_co.txt","a+");
                        fprintf(user6_co,"%i\n",figurinhas_coladas[numero_do_vetor]);
                        fclose(user6_co);
                        break;
                        }
                }



printf("\nSuas figurinhas novas foram coladas com sucesso!\n");
                  printf("                                                    1-Voltar ao menu\n");
                  printf("                                                    2-Visualizar repetidas\n");
                  printf("                                                    3-Visualizar faltantes\n");
                  printf("                                                    4-Comprar mais pacotes\n");
                  scanf("%i",&escolha);

                  switch (escolha)
                  {
                    case 1:
                        {
                           system ("cls");
                           menu_album();

                        }

                    case 2:
                        {
                            system("cls");
                            MostraRepetidas(repetidas);
                            break;

                        }

                    case 3:
                        {
                            system("cls");
                            figurinhas_faltantes();
                            break;
                        }
                    case 4:
                        {
                            system("cls");
                            Compra();
                            break;
                        }
                  }

}


void MostraRepetidas(int vetor_qualquer[600])
{
    int cont1,tam_vet,cont2,auxiliar_opcao;
    tam_vet=0;

    for (cont1=0;vetor_qualquer[cont1]!=0;cont1++)
    {
        tam_vet++;
    }


    printf("\nESSAS SÃO SUAS FIGURINHAS REPETIDAS:\n");
    for (cont2=0;cont2<tam_vet;cont2++)
    {
              printf("\nFigurinha Nro:%i\n",vetor_qualquer[cont2]);
    }


printf("\n\n\n\n\n\n\n");
printf("1-Voltar ao menu\n");
scanf("%i",&auxiliar_opcao);
switch (auxiliar_opcao)
{
case 1 :
    {
        system("cls");
        menu_album();
    }
}



}

void linha (int num, char ch)
{
    int i;
    for (i=1; i<= num ; i++)
        putchar (ch);
}

void colada(int numerodafigura,int vetortantofaz[600])
{
    int i;

  for (i=0;i<600;i++)
  {if (vetortantofaz[i]==numerodafigura)
  {

      printf(" (Colada)");
      break;
  }}



}

void figurinhas_faltantes() //Depende do numero de figurinhas
{
    int i,j,auxiliar9,opcao1;
    for (i=1;i<430;i++)
    {
        auxiliar9=0;
        for (j=0;j<500;j++)
        {
         if(jogadores[i].num_fig==figurinhas_coladas[j])
             {
                auxiliar9=1;
                break;
             }
        }

       if (auxiliar9==0)
        printf("\n(%i)  %s",jogadores[i].num_fig,jogadores[i].nome);
    }

    printf("\n                                        1-Voltar ao menu\n");
    printf("                                        2-Comprar Pacotes\n");
    scanf("%i",&opcao1);

    switch (opcao1)

    {
     case 1:
        {
            system("cls");
            menu_album();

        }
       case 2:

         {
            system("cls");
            Compra();

         }

    }



}


void atualiza_coladas()
{
    int vetor_coladas[1000]={0},auxi=0,teste,i=0,x;

    user0_r= fopen("user0_r.txt","a+");

    for (i=0;i<600;i++)
    {fscanf(user0_r,"%i",&vetor_coladas[i]);
    }

     for (i=0;i<600;i++)
     {
         figurinhas_coladas[i]=vetor_coladas[i];

     }




    fclose(user0_r);






}

void ordena_o_vetor( int vetor[1000])
{  int x,y,z,tam_vet,aux,aux2=0;


for (aux=0;vetor[aux]!=0;aux++)
{
    aux2++;
}
tam_vet=aux2;



x=0;
while (x<tam_vet)
{
 y=x+1;

  while (y<tam_vet)
    { if (vetor[x]>vetor[y])
        {
          aux=vetor[x];
          vetor[x]=vetor[y];
          vetor[y]=aux;
        }
    y=y+1;
}
x=x+1;
}

}

int main()
{
    setlocale(LC_ALL,"Portuguese");
    SetConsoleTitle("ÁLBUM DA COPA 2018");
    numero_do_vetor=0;
    char c;
    iniciar_vetor();
    linha(140,'+');//ESCRITA COPA 2018
    printf("\n");
    linha(140,'+');
    printf("\n\n\n");
    linha(14,' ');linha(9,'O');linha(5,' ');linha(8,'O');linha(4,' ');linha(10,'O');linha(6,' ');linha(8,'O');linha(16,' ');linha(10,'O');linha(6,' ');linha(8,'O');linha(4,' ');linha(4,'O');linha(4,' ');linha(8,'O');printf("\n");
    linha(13,' ');linha(11,'O');linha(3,' ');linha(10,'O');linha(3,' ');linha(11,'O');linha(4,' ');linha(10,'O');linha(15,' ');linha(11,'O');linha(4,' ');linha(10,'O');linha(3,' ');linha(4,'O');linha(3,' ');linha(10,'O');printf("\n");
    linha(12,' ');linha(12,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(12,'O');linha(2,' ');linha(12,'O');linha(14,' ');linha(12,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');printf("\n");
    linha(12,' ');linha(12,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(5,' ');
    linha(4,'O');linha(1,' ');linha(5,'O');linha(2,' ');linha(5,'O');linha(14,' ');linha(12,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');printf("\n");
    linha(12,' ');linha(5,'O');linha(9,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(6,' ');linha(3,'O');linha(1,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(22,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');printf("\n");
    linha(12,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(6,' ');linha(3,'O');linha(1,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(22,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');printf("\n");
    linha(12,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(5,' ');linha(4,'O');linha(1,' ');linha(12,'O');linha(16,' ');linha(10,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(12,'O');printf("\n");
    linha(12,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(12,'O');linha(2,' ');linha(12,'O');linha(15,' ');linha(11,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(3,' ');linha(10,'O');printf("\n");
    linha(12,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(11,'O');linha(3,' ');linha(12,'O');linha(14,' ');linha(10,'O');linha(4,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(8,'O');printf("\n");
    linha(12,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(10,'O'); linha(4,' ');linha(12,'O');linha(14,' ');linha(8,'O');linha(6,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(3,' ');linha(10,'O');printf("\n");
    linha(12,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(14,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');printf("\n");
    linha(12,' ');linha(5,'O');linha(9,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(14,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');printf("\n");
    linha(12,' ');linha(12,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(14,' ');linha(12,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(4,'O');linha(4,' ');linha(4,'O');printf("\n");
    linha(12,' ');linha(12,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(14,' ');linha(12,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(4,'O');linha(2,' ');linha(5,'O');linha(2,' ');linha(5,'O');printf("\n");
    linha(13,' ');linha(11,'O');linha(3,' ');linha(10,'O');linha(3,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(14,' ');linha(12,'O');linha(3,' ');linha(10,'O');linha(3,' ');linha(4,'O');linha(3,' ');linha(10,'O');printf("\n");
    linha(14,' ');linha(9,'O');linha(5,' ');linha(8,'O');linha(4,' ');linha(4,'O');linha(10,' ');linha(4,'O');linha(4,' ');linha(4,'O');linha(14,' ');linha(12,'O');linha(4,' ');linha(8,'O');linha(4,' ');linha(4,'O');linha(4,' ');linha(8,'O');
    printf("\n\n\n");
    linha(140,'+');
    printf("\n");
    linha(140,'+');
    printf("\n");
    ENTER();
    menu_cadastro();
    printf("ÁLBUM DA COPA 2018\n");
    atualiza_coladas();
    menu_album();
}



