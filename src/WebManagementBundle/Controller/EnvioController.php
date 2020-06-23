<?php

namespace WebManagementBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;


class EnvioController extends Controller
{

    /**
     * @return Response
     */
    public function indexAction()
    {
        //obtenemos el usuario
        $usuario = $this->getUser()->getId();

        //cogemos el entity
        $entity = $this->getDoctrine()->getManager();

        //recogemos todos los envios del usuario
        $envioRepository = $entity->getRepository('WebManagementBundle:Envio');
        $envios = $envioRepository->findBy(array(
            'usuario'=>$usuario
        ));

        //recogemos las empresas que no tienen ningún envio de este usuario
        $empresasSinEnvios = $envioRepository->GetEmpresasSinEnvios($entity, $usuario);

        return $this->render('WebManagementBundle:Envio:index.html.twig', array(
            'envios' => $envios,
            'empresasSinEnvios' => $empresasSinEnvios
        ));
    }
}