class DadosController < ApplicationController
  def self.popularDB
    print "Digite a quantidade de dados a serem inseridos no Banco de Dados: "
    qtd = gets.strip
    byebug
    print "Digite o nome da tabela a ser preenchida: "
    tabela = gets.strip
    
    count = 1
    valor_unico = (Array.new(99000){|n| n + 1 * 1000}).shuffle
    nomes_arr = (Dados.nomes[:nomes]).shuffle

    until count > qtd.to_i do
    
      tabela.constantize.create!(id: count,
                                 first_name: nomes_arr[Random.rand(nomes_arr.length - 1)],
                                 valor: Random.rand(0...1000), 
                                 coluna1: (Dados.nomes[:lados][Random.rand(Dados.nomes[:lados].length - 1)]), 
                                 coluna2: nil,
                                 unico: valor_unico[count])
      
      count += 1
    end
    return true
    # return "=== Tabela preenchida com SUCESSO!!! ==="
  end

  def self.nomes
   {
      nomes: ['Alexandre', 'Eduardo', 'Henrique', 'Murilo',	'Theo',
              'André', 'Enrico', 'Henry', 'Nathan', 'Thiago',
              'Antônio', 'Enzo', 'Ian	Otávio', 'Thomas',
              'Augusto', 'Erick', 'Isaac', 'Pietro', 'Vicente',
              'Breno', 'Felipe', 'João', 'Rafael', 'Vinícius',
              'Bruno', 'Fernando', 'Kaique', 'RaulVitor',
              'Caio', 'Francisco', 'Leonardo', 'RianYago',
              'Cauã', 'Frederico', 'Luan', 'Ricardo', 'Ygor',
              'Daniel', 'Guilherme', 'Lucas', 'Rodrigo', 'Yuri',
              'Danilo', 'Gustavo', 'Mathias', 'Samuel', 'Agatha', 'Camila',
              'Alícia', 'Carolina', 'Fernanda', 'Joana', 'Malu', 'Nicole',
              'Amanda', 'Catarina', 'Gabriela', 'Laís', 'Maria', 'Olívia',
              'Ana', 'Cecília', 'Gabrielle', 'Lara', 'Mariah', 'Pietra',
              'Antonela', 'Clara', 'Giovanna', 'Larissa', 'Mariana', 'Rafaela',
              'Aurora', 'Clarice', 'Giulia', 'Lavínia', 'Marina', 'Rebeca',
              'Bárbara', 'Eduarda', 'Heloísa', 'Letícia', 'Maya', 'Sara',
              'Beatriz', 'Elisa', 'Isabel', 'Liz', 'Melissa', 'Sophie',
              'Bianca', 'Emanuelly', 'Isabelly', 'Lorena', 'Milena', 'Stella',
              'Bruna', 'Emilly', 'Isadora', 'Luana','Mirella', 'Vitória',
              'Yasmin', 'Esther', 'Isis', 'Maitê','Natália'],
      lados: ['cima', 'esquerda', 'baixo', 'direita']
    }
  end

  def self.test
    input = gets
    while 
    input[/[[:lower:]]</]
    input.gsub!(/[[:lower:]]</, "") 
    end 
    input.gsub!(/</, "") 
    puts"#{input}"
  end

  def self.teste
    ActiveRecord::Base.connection.exec_query("SELECT * FROM TABELA_AS ta WHERE ta.ID = 1")
  end

  def self.js
    a = `node app/controllers/java.js`
    puts a.to_i + 1
    return true
  end

  def self.bgm
    # counter = 0
    begin
      puts 'BEGIN algo que pode gerar uma exceção'
      teste = 'teste begin'
      hgbig
      # counter += 1
      # puts counter
    rescue #SomeExceptionClass => some_variable
      puts 'RESCUE 1 código que lida com alguma exceção'
      teste = 'teste rescue 1'
      hgbig
      
      # retry if counter <= 3  
      
    rescue #SomeOtherException => some_other_variable
      puts 'RESCUE 2 código que lida com alguma outra exceção'
      teste = 'teste rescue 2'
      return teste
      
    # else
    #   puts 'ELSE código que é executado apenas se * nenhuma * exceção foi levantada'

    # ensure
    #   puts 'ENSURE garantir que este código sempre seja executado, não importa o que'
    #   puts 'ENSURE não altera o valor final do bloco'
    #   teste = 'teste ensure'
      # return teste
    end
  end

  def testes()
    puts '================================================================'
    puts "#{params[:valor]}"
    puts "#{}"
    puts '================================================================'
  end
end
