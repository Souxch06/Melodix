.class public interface abstract Ltv1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/IInterface;


# virtual methods
.method public abstract beginAdUnitExposure(Ljava/lang/String;J)V
.end method

.method public abstract clearConditionalUserProperty(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
.end method

.method public abstract clearMeasurementEnabled(J)V
.end method

.method public abstract endAdUnitExposure(Ljava/lang/String;J)V
.end method

.method public abstract generateEventId(Lvv1;)V
.end method

.method public abstract getAppInstanceId(Lvv1;)V
.end method

.method public abstract getCachedAppInstanceId(Lvv1;)V
.end method

.method public abstract getConditionalUserProperties(Ljava/lang/String;Ljava/lang/String;Lvv1;)V
.end method

.method public abstract getCurrentScreenClass(Lvv1;)V
.end method

.method public abstract getCurrentScreenName(Lvv1;)V
.end method

.method public abstract getGmpAppId(Lvv1;)V
.end method

.method public abstract getMaxUserProperties(Ljava/lang/String;Lvv1;)V
.end method

.method public abstract getSessionId(Lvv1;)V
.end method

.method public abstract getTestFlag(Lvv1;I)V
.end method

.method public abstract getUserProperties(Ljava/lang/String;Ljava/lang/String;ZLvv1;)V
.end method

.method public abstract initForTests(Ljava/util/Map;)V
.end method

.method public abstract initialize(Lid0;Llw1;J)V
.end method

.method public abstract initializeWithElapsedTime(Lid0;Llw1;JJ)V
.end method

.method public abstract isDataCollectionEnabled(Lvv1;)V
.end method

.method public abstract logEvent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJ)V
.end method

.method public abstract logEventAndBundle(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Lvv1;J)V
.end method

.method public abstract logEventWithElapsedTime(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJJ)V
.end method

.method public abstract logHealthData(ILjava/lang/String;Lid0;Lid0;Lid0;)V
.end method

.method public abstract onActivityCreated(Lid0;Landroid/os/Bundle;J)V
.end method

.method public abstract onActivityCreatedByScionActivityInfo(Lmw1;Landroid/os/Bundle;J)V
.end method

.method public abstract onActivityDestroyed(Lid0;J)V
.end method

.method public abstract onActivityDestroyedByScionActivityInfo(Lmw1;J)V
.end method

.method public abstract onActivityPaused(Lid0;J)V
.end method

.method public abstract onActivityPausedByScionActivityInfo(Lmw1;J)V
.end method

.method public abstract onActivityResumed(Lid0;J)V
.end method

.method public abstract onActivityResumedByScionActivityInfo(Lmw1;J)V
.end method

.method public abstract onActivitySaveInstanceState(Lid0;Lvv1;J)V
.end method

.method public abstract onActivitySaveInstanceStateByScionActivityInfo(Lmw1;Lvv1;J)V
.end method

.method public abstract onActivityStarted(Lid0;J)V
.end method

.method public abstract onActivityStartedByScionActivityInfo(Lmw1;J)V
.end method

.method public abstract onActivityStopped(Lid0;J)V
.end method

.method public abstract onActivityStoppedByScionActivityInfo(Lmw1;J)V
.end method

.method public abstract performAction(Landroid/os/Bundle;Lvv1;J)V
.end method

.method public abstract registerOnMeasurementEventListener(Lzv1;)V
.end method

.method public abstract resetAnalyticsData(J)V
.end method

.method public abstract resetAnalyticsDataWithElapsedTime(JJ)V
.end method

.method public abstract retrieveAndUploadBatches(Lxv1;)V
.end method

.method public abstract setConditionalUserProperty(Landroid/os/Bundle;J)V
.end method

.method public abstract setConsent(Landroid/os/Bundle;J)V
.end method

.method public abstract setConsentThirdParty(Landroid/os/Bundle;J)V
.end method

.method public abstract setCurrentScreen(Lid0;Ljava/lang/String;Ljava/lang/String;J)V
.end method

.method public abstract setCurrentScreenByScionActivityInfo(Lmw1;Ljava/lang/String;Ljava/lang/String;J)V
.end method

.method public abstract setDataCollectionEnabled(Z)V
.end method

.method public abstract setDefaultEventParameters(Landroid/os/Bundle;)V
.end method

.method public abstract setEventInterceptor(Lzv1;)V
.end method

.method public abstract setInstanceIdProvider(Lkw1;)V
.end method

.method public abstract setMeasurementEnabled(ZJ)V
.end method

.method public abstract setMinimumSessionDuration(J)V
.end method

.method public abstract setSessionTimeoutDuration(J)V
.end method

.method public abstract setSgtmDebugInfo(Landroid/content/Intent;)V
.end method

.method public abstract setUserId(Ljava/lang/String;J)V
.end method

.method public abstract setUserProperty(Ljava/lang/String;Ljava/lang/String;Lid0;ZJ)V
.end method

.method public abstract unregisterOnMeasurementEventListener(Lzv1;)V
.end method
