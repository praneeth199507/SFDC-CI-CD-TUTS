<aura:application extends="force:slds" >
     <aura:attribute name="savevalue" type="String"/>
    
    <c:Picklist savevalue="{!v.savevalue}" />
    
    You have selected : {!v.savevalue}
    
</aura:application>