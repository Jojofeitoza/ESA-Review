package esa_review.controller;

import static org.junit.Assert.*;

import org.junit.Test;

public class ProdutoControllerTest {

	/**@Test
    public void TestAdicionarProduto(){
    
        ControleProduto ctlProduto = new ControleProduto();
        Produto prod = new Produto("Os vingadores", "Filmes", 2.0f, 52, "caminho");
        ctlProduto.adicionarProduto(prod); 
        assertTrue(ctlProduto.verificaProduto(prod));
        
        
        Produto prod2 = new Produto("notebook", "informatica", 1000.0f, 36, "caminho");
        assertFalse(ctlProduto.verificaProduto(prod2));

    }
    
    @Test
    public void testAlterarProduto(){
    
        ControleProduto ctlProduto = new ControleProduto();
        Produto prod = new Produto("Os vingadores", "Filmes", 2.0f, 52, "caminho");
        ctlProduto.adicionarProduto(prod);
        
        Produto temp = ctlProduto.getProduto(52);
        
        assertEquals(temp, prod);        
        
        temp.setDesc("Jaspion");
        
        assertEquals(prod.getDesc(), "Jaspion");
        assertEquals(temp.getDesc(), "Jaspion");
        
        assertTrue(ctlProduto.verificaProduto(temp));
        
    
    
    }
    
    @Test
    public void testRemoverProduto(){
    
        ControleProduto ctlProduto = new ControleProduto();
        Produto prod = new Produto("Os vingadores", "Filmes", 2.0f, 52, "caminho");
        ctlProduto.adicionarProduto(prod);
        
        int cod = 52;
        
        Produto temp = ctlProduto.removerProduto(cod);
        
     
        assertEquals(temp, prod);
        
        assertFalse(ctlProduto.verificaProduto(temp));
        
    
    
    }*/

}
