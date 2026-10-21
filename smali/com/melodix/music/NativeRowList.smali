.class public final Lcom/melodix/music/NativeRowList;
.super Ljava/lang/Object;

# Registers stay single-typed: ART VerifyError if an int and a String
# share a register across the scan loop.

.method public static fill(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;)V
    .locals 10

    if-eqz p1, :done
    if-eqz p2, :empty

    const-string v0, "\"title\""
    const/4 v1, 0x0
    const/4 v7, 0x0
    const/4 v8, -0x1

    :scan_loop
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v2
    if-eq v2, v8, :scan_done

    const-string v4, ":"
    invoke-virtual {p2, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v3
    if-eq v3, v8, :scan_done

    const-string v4, "\""
    add-int/lit8 v3, v3, 0x1
    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v5
    if-eq v5, v8, :scan_done

    add-int/lit8 v5, v5, 0x1
    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I
    move-result v3
    if-eq v3, v8, :scan_done

    invoke-virtual {p2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z
    move-result v9
    if-nez v9, :scan_advance

    if-eqz v7, :scan_clear
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    const/4 v7, 0x1
    :scan_clear
    const/4 v9, -0x1
    invoke-static {p0, p1, v6, v9}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :scan_advance
    add-int/lit8 v1, v3, 0x1
    goto :scan_loop

    :scan_done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done

    :empty
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v0
    if-lez v0, :done
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V
    const-string v0, "Chargement de votre accueil…"
    const v1, -0x4c4c4d
    invoke-static {p0, p1, v0, v1}, Lcom/melodix/music/NativeRowList;->addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V

    :done
    return-void
.end method

.method private static addLine(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/lang/String;I)V
    .locals 4

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v1, 0x41800000
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V
    const/16 v1, 0x10
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v2, -0x1
    const/4 v3, -0x2
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    return-void
.end method
