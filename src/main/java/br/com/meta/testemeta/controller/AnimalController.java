package br.com.meta.testemeta.controller;

import br.com.meta.testemeta.editor.CustomHabitatEditor;
import br.com.meta.testemeta.editor.CustomOrdemEditor;
import br.com.meta.testemeta.model.Animal;
import br.com.meta.testemeta.model.Habitat;
import br.com.meta.testemeta.model.Ordem;
import br.com.meta.testemeta.service.AnimalService;
import br.com.meta.testemeta.service.ClasseService;
import br.com.meta.testemeta.service.HabitatService;
import br.com.meta.testemeta.service.OrdemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Grupo Meta
 * Teste
 * Daniel Pinheiro Vargas
 * Criado em 25/09/2016.
 */

@Controller
public class AnimalController {

    @Autowired
    private AnimalService animalService;

    @Autowired
    private OrdemService ordemService;

    @Autowired
    private ClasseService classeService;

    @Autowired
    private HabitatService habitatService;

    @InitBinder
    protected void initBinder(HttpServletRequest request, WebDataBinder binder) throws Exception {
        if ("post".equals( request.getMethod().toLowerCase() )){
            binder.registerCustomEditor(Ordem.class, new CustomOrdemEditor(ordemService));
            binder.registerCustomEditor(Habitat.class, new CustomHabitatEditor(habitatService));
        }
    }

    @RequestMapping(value = "/animal.action", method = RequestMethod.GET)
    public String getPage(@ModelAttribute("animal") Animal animal, Model model)
    {

        model.addAttribute("ordens", ordemService.getAll());
        model.addAttribute("classes", classeService.getAll());
        model.addAttribute("habitats", habitatService.getAll());

        return "animais";
    }

    @RequestMapping(value = "/animal/edit.action", method = RequestMethod.GET)
    public String getEditPage(@RequestParam("id") String id, Model model)
    {
        Animal animal = animalService.getById(Long.parseLong( id ) );
        model.addAttribute("animal", animal);

        model.addAttribute("ordens", ordemService.getAll());
        model.addAttribute("classes", classeService.getAll());
        model.addAttribute("habitats", habitatService.getAll());

        return "edit";
    }


    @RequestMapping(value = "/animal/save.action", method = RequestMethod.POST)
    public String save(@ModelAttribute("animal") Animal animal)
            throws Exception
    {
        String urlView = "redirect:/animal.action";
        try {
            if (animal.getIndAmeacado()== null) {
                animal.setIndAmeacado("2");
            }
            animalService.save(animal);
            urlView += "?success=true";
        } catch (Exception e) {
            e.printStackTrace();
            urlView += "?error=true";
        }

        return urlView;
    }


    @RequestMapping(value = "/animal/update.action", method = RequestMethod.POST)
    public String update(@ModelAttribute("animal") Animal animal)
            throws Exception
    {
        String urlView = "redirect:/animal.action";
        try {
            if (animal.getIndAmeacado()== null) {
                animal.setIndAmeacado("2");
            }
            animalService.save(animal);
            urlView += "?success=true";
        } catch (Exception e) {
            e.printStackTrace();
            urlView += "?error=true";
        }

        return urlView;
    }


    //===========================AJAX========================

    @RequestMapping( value = "/ajax/animal.action", method={RequestMethod.POST,RequestMethod.GET} )
    public @ResponseBody
    Map<String, Object[]> getList(){

        Collection<Animal> animalList = null;

        try{
            animalList = animalService.getAll();



        }catch(Exception e){
            e.printStackTrace();
            //response.setStatus( 503 );

        }

        return Collections.singletonMap("aaData", getJSONForUser(animalList));
    }

    /**
     * I only want certain user info..
     */
    public Object[] getJSONForUser(Collection<Animal> animalList){
        Object[] rdArray = new Object[animalList.size()];
        int i = 0;
        for(Animal a:animalList){
            // [ idAnimal, classe, ordem, nome, nomeCinetifico, Habitat, Ameaçado ]
            Object[] us = new String[]{String.valueOf(a.getIdAnimal()), a.getOrdem().getClasse().getDescricao(),
                    a.getOrdem().getDescricao(), a.getNome(), a.getNomeCientifico(), a.getHabitat().getDescricao(),
                    a.getIndAmeacado().equals("1") ? "Sim": "Não"};
            rdArray[i] = us;
            i++;
        }
        return rdArray;
    }


    @RequestMapping(value = "/ajax/animal/delete.action", method = RequestMethod.GET)
    public
    @ResponseBody
    String delete(@RequestParam("id") String id) throws Exception
    {
        String teste = "0";
        try {
            Animal animal = animalService.getById(Long.parseLong( id ) );
            animalService.delete(animal);
            teste = "1";
        } catch (Exception e) {
            e.printStackTrace();

        }

        return teste;
    }

    @RequestMapping(value = "/ajax/ordem/getOrdens.action", method = RequestMethod.GET)
    public @ResponseBody Map<String, ?> getOrdens(@RequestParam String idClasse)
    {
        HashMap<String, Object> modelMap = new HashMap<String, Object>();

        try {
            modelMap.put("filteredordens", ordemService.getOrdensByClasse(idClasse));
            modelMap.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("success", false);
            modelMap.put("message", e.getMessage());
        }

        return modelMap;
    }

}

