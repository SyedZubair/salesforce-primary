<aura:application  extends="force:slds" >
	<!-- Header -->
<lightning:layout class="slds-page-header" >
    <lightning:layoutItem padding="horizontal-small">
        <lightning:icon iconName="custom:custom54" />
    </lightning:layoutItem>     
    <h1>
         Friends with Boats
    </h1>
</lightning:layout>
<lightning:layout>
        <c:BoatSearchForm />  
</lightning:layout>
</aura:application>