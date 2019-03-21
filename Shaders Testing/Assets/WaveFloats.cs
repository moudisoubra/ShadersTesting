using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaveFloats : MonoBehaviour
{
    Renderer rend;
    public float Factor;
    // Start is called before the first frame update
    void Start()
    {
        rend = GetComponent<Renderer>();
        rend.material.shader = Shader.Find("Wave");
    }

    // Update is called once per frame
    void Update()
    {

    }
}
