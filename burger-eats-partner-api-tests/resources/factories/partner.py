
def factory_new_partner():
    partner = {
        'name': 'Pizzas Mothe',
        'email': 'contato@mothe.com.br',
        'whatsapp': '21988776655',
        'business': 'Restaurante'
    }
    
    return partner

def factory_dup_name():
    partner = {
        'name': 'Adega do João',
        'email': 'contato@adegajoao.com.br',
        'whatsapp': '21988776655',
        'business': 'Conveniência'
    }
    
    return partner

def factory_partner_list():
    p_list = [
        
        {
            'name': 'Mercearia Mothe',
            'email': 'contato@mmothe.com.br',
            'whatsapp': '21988770001',
            'business': 'Conveniência'
        },
        {
            'name': 'Mercadinho São Francisco',
            'email': 'contato@msf.com.br',
            'whatsapp': '21988770002',
            'business': 'Supermercado'
        },
        {
            'name': 'Bom de Prato',
            'email': 'contato@bomdeprato.com.br',
            'whatsapp': '21988770003',
            'business': 'Restaurante'
        },
    ]
    
    
    return p_list