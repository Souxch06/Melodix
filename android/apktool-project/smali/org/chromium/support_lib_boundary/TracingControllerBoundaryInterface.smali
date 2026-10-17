.class public interface abstract Lorg/chromium/support_lib_boundary/TracingControllerBoundaryInterface;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# virtual methods
.method public abstract isTracing()Z
.end method

.method public abstract start(ILjava/util/Collection;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation
.end method

.method public abstract stop(Ljava/io/OutputStream;Ljava/util/concurrent/Executor;)Z
.end method
