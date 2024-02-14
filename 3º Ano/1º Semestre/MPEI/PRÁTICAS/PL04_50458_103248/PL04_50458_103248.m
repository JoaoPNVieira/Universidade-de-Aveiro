%%
%{
################################
UNIVERSIDADE DE AVEIRO [2023/24]
UC: MPEI
ALUNOS: JOÃO PEDRO NUNES VIEIRA, 50458
        JOSÉ MIGUEL GUARDADO SILVA, 103248

CURSO: LECI
################################

[ PL04 - Algoritmos Probabilísticos ]
%}
%% [ SECÇÃO PARA AVALIAÇÃO ]
%{
    Opção 1 - Display de generos

    Opção 2 - Counting Bloom Filter
                DÁ Nº DE FILMES DE GENERO XPTO
    Opção 3 - Counting Bloom Filter
                DÁ Nº DE FILMES DE GENERO E ANO XTOP 1234
    Opção 4 - Minhash
                Ver quais os tipos mais parecidos a tring e verificar quais são os mais similares (5) Filmes e indicar os seus generos
    Opção 5 - Similaridade em generos
                Quais os filmes (ordenados de mais recente para antigo) de similares em relação a generos

%}
    go = 0;
    while go == 0
        fprintf(['\n \n \n SELECTION MENU: \n \n' ...
                 '1 - Display available genres \n' ...
                 '2 - Number of movies of a genre \n' ...
                 '3 - Number of movies of a genre on a given year\n' ...
                 '4 - Search movie titles \n'...
                 '5 - Serch movies based on genres \n' ...
                 '6 - Exit \n \n']);
        select = "Select an option: ";
        option = input(select);
        if option > 0 && option < 7
            switch option
                %% ########################################################
                %% OPTION 1: DONE
                case 1
                    fprintf('The available genres are: ')
                    for i = 1: length(genreList)-2
                        fprintf('%s, ',genreList{i})
                    end
                    fprintf('%s \n',genreList{length(genreList)-1})
                                              
                %% ########################################################
                %% OPTION 2:
                case 2
                    moviesByGenre()

                %% ########################################################
                %% OPTION 3:
                case 3
                    moviesByGenreAndYear()

                %% ########################################################
                %% OPTION 4:
                case 4
                    minHashOp4()
                    
                %% ########################################################
                %% OPTION 5:
                case 5
                    minHashOp5()

                %% ########################################################
                %% OPTION 6: DONE
                case 6
                    go = 1; clc;
                    msgbox("Goodbye...","Success");
                otherwise
                    disp('UNEXPECTED ERROR')
            end
        else
            msgbox("INVALID CHOICE! Try again...","Error","error");
        end
    end
%% THE END ----------------------------------------------------------------