.class public interface abstract Lorg/chromium/support_lib_boundary/WebViewStartUpResultBoundaryInterface;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public abstract getBlockingStartUpLocations()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMaxTimePerTaskInUiThreadMillis()Ljava/lang/Long;
.end method

.method public abstract getTotalTimeInUiThreadMillis()Ljava/lang/Long;
.end method
