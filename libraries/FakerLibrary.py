from faker import Faker

fake = Faker()

class FakerLibrary:
    
    def generate_fake_name(self):
        """Gera um nome falso"""
        return fake.name()
    
    def generate_fake_email(self):
        """Gera um e-mail falso"""
        return fake.email()

    def generate_fake_country(self):
        """Gera um e-mail falso"""
        return fake.country()
    
    def generate_fake_city(self):
        """Gera um e-mail falso"""
        return fake.city()
    