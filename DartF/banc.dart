class compte{
  
  String nom_client='';
  String prenom_client='';
  int solde_final= 0 ;

  compte(){
    this.nom_client;
    this.prenom_client;
    this.solde_final;
  }
  
  String getNomClient(){
    return nom_client;
  }
   String getPrenomClient(){
    return prenom_client;
  }
  int getSoldeFinal(){
    return solde_final;
  }

  void SetNomClient(String n){
    nom_client = n;
  }
  void SetPrenomClient(String p){
    prenom_client=p;
  }
  void SetSoldeFinal(int s){
    solde_final = s ;
  }

  void deposer(int som ){
    solde_final = solde_final + som;
  }

  void retirer(int som){
    if(solde_final>=som){
    solde_final = solde_final - som;
    }
    else (print("Mantant Insufisant !!!!!"));
  }
  
  void afficher_sold(){
    print(solde_final);
  }

  void debiter_compte(compte c2, int mantant){

    if(solde_final>=mantant){

    solde_final = solde_final - mantant;
    c2.deposer(mantant);
    }
  else(print("Mantant Insufisant !!!!!"));
  }

void crediter_compte(compte c2, int mantant){

    if(c2.solde_final>=mantant){

    c2.retirer(mantant);
    solde_final = solde_final + mantant;

    }
    else(print("Le Mantant D'autre compte est Insufisant !!!!!"));
  }

}

void main(){

compte c1 = new compte();
compte c2 = new compte();

c1.deposer(200);
c1.deposer(70);

c2.deposer(1000);
c2.retirer(30);

c1.debiter_compte(c2, 300);
c1.crediter_compte(c2, 100);

c1.afficher_sold();
c2.afficher_sold();

c1.debiter_compte(c2,400);
}